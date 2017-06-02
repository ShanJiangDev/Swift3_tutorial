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



    }
}














































