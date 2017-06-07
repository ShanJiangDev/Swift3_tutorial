//
//  10_Properties.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-02.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Properties{
    
    class func StoredProperties(){
        
        // 1. Stored properties: they store constant and variable values as part of an instance. They are provided only by classes and structures.
        
        // 2. Computed properties: they calculate(rather than store) a value. They are provided by classes, structures, and enumerations.
        
        // Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associted with the type itself -- Type Properties
        
        // 4. Property observers: Defined property observers to monitor changes in a property's value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourslef, and also to properties that a subclass inherits from its superclass.
        
        /*-----------------1. Stored Properties-----------------*/
        print("/*-----------------1. Stored Properties-----------------*/ \n")
        
        // In its simplest form, it is a constant or variable that is stored as part of an instance of a particular class or structure.
        // It can be 1. Variable stored properties -- introduced by the "var" keyword
        //           2. Constant stored properties == introduced by the "let" keyword
        
        // Useage:
        // 1. You can provide a default value for a stored property as part of its definition
        // 2. You can also set and modify the initial value for a stored property during initialization. -- even for constant stored properties.
        
        struct FixedLengthRange{
            var firstValue: Int // variable stored property
            let length: Int     // constant stored property, which initialized when the new range is created and 
                                // can not be changed thereafter
        }
        
    
        
        // the length of this struct cannot be changed once it is created.
        
        var rangeOfThreeTimes = FixedLengthRange(firstValue: 0, length: 3)
        // represents : 0,1,2
        rangeOfThreeTimes.firstValue = 6
        // represents : 6,7,8
        
        /*-----------------2. Stored Properties of Constant Structure Instances-----------------*/
        print("/*-----------------2. Stored Properties of Constant Structure Instances-----------------*/ \n")
        
        // Conclustion: Stored(both var and let) properties of a constant structure instance can not be modified
        //  -> Structures is a Value Type, when an instance of a value type is marked as a constant, so are all of its properties.
        
        // When create an instance of a structure and assign this instance to a constant, you cannot modify the instance's properties, even if they were declared as variable properties
        
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // represents: 0,1,2,3
        
        //rangeOfFourItems.firstValue = 6 -> Error, even though firstValue is a variable property
        // Because rangeOfFourItems is declared as a constant, with the let keyword, it is not possible to change its firstValue property, eventhough firstValue is a variable property
        
        // This rule doesnt work for classes, which are reference type. If you assign an instance of a reference type to a constant, you can still change that instance's variable properties.
        
        
        
        /*-----------------3. Lazy Stored Properties-----------------*/
        print("/*-----------------3. Lazy Stored Properties-----------------*/ \n")
        
        // Defination: A property whose initial value is not calculated until the first time it is used.
        
        // Useage: Indicate a "lazy" stored property by writing the "lazy" modifier before its declaration
        //  Lazy property must be declared as a variable, because its initial value might not be retrieved untill after instance initialization complets. (Constant properties must always have a value before initialization completes)
        
        // When to use: 
        // 1, When the initial value for a property is dependent on outside factors whose values are not known untill after an instance's initialization is complete.
        // 2. When the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until its needed.
        
        
        // Use a lazy stored property to avoid unnecessary initialization of a complex class.
        class DataImpoter{
            var filename = "data.txt"
        }
        // Why use "lazy": It is possible for a DataManager instance to manage its data without ever importing data from a file, so there is no need to create a new DataImporter instance when the DataManager itself is created. -> Instead it makes more sense to create the DataImporter instance if and when it is first used.
        class DataManager{
            lazy var importer = DataImpoter()
            var data = [String]()
        }
        
        let manager = DataManager()
        manager.data.append("Some data")
        manager.data.append("Some More data")
        print("manager.data:\(manager.data)")
        
        // Because it is marked with the lazy modifier, the DataImporter instance for the importer property is only created when the importer property is first accesssed, such as when its filename property is queried:
        
        // Use "breakpoint" on the next line and "let manager = DataManager()"line to check the initialize process for DataImporter instance
        print("manager.importer.filename: \(manager.importer.filename)")
        
        // multiple threads with lazy: if a property marked with the lazy modifier is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no guarantee that the property will be initialized only once.
        
        /*-----------------4. Stored Properties and Instance Variables -----------------*/
        print("/*-----------------4. Stored Properties and Instance Variables -----------------*/ \n")
        
        // In swift all information about the property, including its name, type, and memory management characteristics, is defined in a single location as part of the type's definition
        
        /*-----------------5. Computed Properties -----------------*/
        print("/*-----------------5. Computed Properties -----------------*/ \n")
        
        // Definition: classes, strucures and enumberations can defin computed properties -- which do not actually store a value. instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly
        
        struct Point {
            var x = 0.0, y = 0.0
        }
        
        struct Size {
            var width = 0.0, height = 0.0
        }
        
        // The current center position of a Rect can always be determined from its origin and size, and so you dont need to store the center point as an explicit Point value. Instead, Rect defines a custom getter and setter for a computed variable called center, to enable you to work with the rectangle's center as if it were a real stored property.
        
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point{ // Computed property
                get {
                    let centerX = origin.x + (size.width/2)
                    let centerY = origin.y + (size.height/2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter){
                    origin.x = newCenter.x - (size.width/2)
                    origin.y = newCenter.y - (size.height/2)
                }
            }
        }
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        
        

        // This line did:
        // 1. The square variable's center property is accessed through dot syntax, which cause the Getter for center to be called -- retrieve the current property value
        // 2. The GETTER calculates and returns a new Point to represent the center of the square -> (5, 5)
        let initialSquareCenter = square.center   //---- Get
        
        print("square.origin center is now at (\(initialSquareCenter.x), \(initialSquareCenter.y))")
        
        // This line did:
        // 1. Set the center property to a new value set.
        // 2. Modify the x and y values of the stored origin property
        square.center = Point(x: 15.0, y: 15.0)   //---- Set
        
        
        print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        print("square.new center is now at (\(square.center.x), \(square.center.y))")
        
        
        /*-----------------6. Shorthand Setter Declaration -----------------*/
        print("/*-----------------6. Shorthand Setter Declaration -----------------*/ \n")
        
        // If a computed property's setter does not define a name for the new value to be set, a default name of newValue is used.
        
        // Here is an alternative version of the Rect structure, which takes advantage of this shorthand notation.
        
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point{
                get {
                    let centerX = origin.x + (size.width/2)
                    let centerY = origin.y + (size.height/2)
                    return Point(x: centerX, y: centerY)
                }
                set{ // <-- Doesnt not define a name for the new value to be set.
                    origin.x = newValue.x - (size.width/2) // <- using the default name of "newValue"
                    origin.y = newValue.y - (size.height/2)
                }
            }
        }
        
        /*-----------------7. Read-only Computed Properties -----------------*/
        print("/*-----------------7. Read-only Computed Properties -----------------*/ \n")
        
        // Definitation: A computed property with a getter but no setter, it always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.
        
        struct Cuboid{
            var width = 0.0, height = 0.0, depth = 0.0
            var valume: Double {
                return width * height * depth
            }
        }
        
        let fourByFiveByTwo = Cuboid(width: 0.0, height: 5.0, depth: 2.0)
        print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.valume)")


        /*-----------------8. Property Observers -----------------*/
        print("/*----------------- 8. Property Observers -----------------*/ \n")
        
        // Definitation: They observe and respond to changes in a property's value. Property Observers are called every time a property's value is set, even if the new value is the same as the property's current value.
        
        // Where to use: Property observers can be added to any stored properties you define(included to any inherited property whether stored or computed by overriding the property within a subclass),
        //  expect for lazy stored properties.
        
        // Do not need to define property observers for nonoverridden computed properties, because you can observe and respond to changes to their value in the computed property's setter.
        
        // You have the option to define either or both of these observers on a property:
        // 1. willSet: is called just before the value is stored.
        // 2. didSet:  is called immediately after the new value is stored.
        
        // How to use willSet/didSet:
        // Method 1: if you implement a willSet observer, its passed the new property value as a constant parameter. You can specify a name for this parameter as part of your willSet implementation. 
        // Method 2: if you dont write the parameter name and parenthese within your implementation, the parameter is made available with a default parameter name of "newValue -- willSet, oldValue -- didSet"
        
        // Using for superclass - subclass: These two observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.
        
        class StepCounter{
            var totalSteps: Int = 0{
                willSet(newTotalSteps){
                    print("About to set totalSteps to \(newTotalSteps)")
                }
                didSet{
                    if totalSteps > oldValue {
                        print("Added \(totalSteps - oldValue) steps")
                    }
                }
            }
        }
        
        let stepCounter = StepCounter()
        
        stepCounter.totalSteps = 200
        
        stepCounter.totalSteps = 100
        
        stepCounter.totalSteps = 100 // willSet and didSet are called everytime whenever the property is assigned   
                                     // a new value or not.
        
        stepCounter.totalSteps = 360
        
        stepCounter.totalSteps = 896
        
       // inout property always come with willSet and didSet
        
        
        /*----------------- 9. Global and Local Variables -----------------*/
        print("/*----------------- 9. Global and Local Variables -----------------*/ \n")
        
        
        // Both Global and local variable can
        // * has the capabilities for computing and observing
        // * can be stored variable -- observing
        //      provide storage for a value of a certain type and allow that value to be set and retrieved.
        // * can be computed variable -- computing
        //      it can calculate their value, rather than storing it, and they are written in the same way as computed properties.
        
        //Global Variable
        // * Defined outside of any function, method, closure, or type context.
        // * Global constants and variables are always computed lazily, in a simmilar manner to Lazy Stored Properties. But they do not need to marked with "lazy" modifier.
        
        //Local Variable
        // * Defined within a function, method, or closure context,
        // * Never computed lazily
        
        /*----------------- 10. Type Properties -----------------*/
        print("/*----------------- 10. Type Properties -----------------*/ \n")
        
        
        // Instance properties definitation: properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.
        
        // Type properties Definitation: These properties belong to the type itself. not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instance of that type you create.
        
        // Type properties useage: Useful for defining values that are universal to all instances of a particular type, such as a constant property that all instances can use, or a variable property that stores a value that is global to all instances of that type.
        
        // Type properties:
        // 1. Stored type properties: var or let
        //    * Must always give stored type properties a defaultvalue (because the type itself does not have an initializer that can assign a value to a stored type property at initialization time)
        //    * Lazily initialized on their first access. They are guaranteed to be initialized only once, even when accessed by multiple thread simultaneously, and they do not need to be marked with the "lazy" modifier.
        
        // 2. Computed type properties: var
        //--------------------------------------------
        // 3. Stored instance properties: var or let
        
        // 4. Computed instance properties: var
        
        // Syntax: type properties are written as part of the type's definition. Define type properties with the "static" keyword. For computed type properties for class types, you can use the "class" keyword instead to allow subclasses to override the superclass's implementation.
        
        
        struct SomeStructure{
            static var storedTypeProperty = "Some Value."
            static var computedTypeProperty: Int {
                return 1
            }
        }
        
        enum SomeEnumeration {
            static var storedTypeProperty = "Some value."
            static var computedTypeProperty: Int {
                return 6
            }
        }
        
        class SomeClass {
            static var storedTypeProperty = "Some Value."
            static var computedTypeProperty: Int {
                return 27
            }
            class var overrideableComputedTypeProperty: Int {
                return 107
            }
        }
        
        /*----------------- 11. Querying and Setting Type Properties -----------------*/
        print("/*----------------- 11. Querying and Setting Type Properties -----------------*/ \n")
        
        // Type properties are queried and set on the type, not on an instance of that type.
        
        print(SomeStructure.storedTypeProperty)
        
        SomeStructure.storedTypeProperty = "Another value."
        
        print(SomeStructure.storedTypeProperty)
        
        print(SomeEnumeration.computedTypeProperty)
        
        print(SomeClass.computedTypeProperty)
        
        struct AudioChannel {
            static let thresholdLevel = 10                  // -- Type property
            static var maxInputLevelForAllChannels = 0      // -- Type property
            var currentLevel: Int = 0{ // stored instance   // -- Instance property
                didSet {
                    if currentLevel > AudioChannel.thresholdLevel {
                        // cap the new audio level to the threshold level
                        currentLevel = AudioChannel.thresholdLevel
                        // here currentLevel is set to another value, however "didSet" will not be called.
                    }
                    if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                        AudioChannel.maxInputLevelForAllChannels = currentLevel
                    }
                }
            }
        }
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        print(AudioChannel.maxInputLevelForAllChannels)
        leftChannel.currentLevel = 7
        print(leftChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
        
        leftChannel.currentLevel = 11
        print(leftChannel.currentLevel)
        print(AudioChannel.maxInputLevelForAllChannels)
    }
}














































