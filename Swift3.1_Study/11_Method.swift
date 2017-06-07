//
//  11_Method.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-07.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Method{
    class func instanceMethod(){
        
        // Definiation: Methods are functions that are associated with a particular type.
        // Instance Method: Classes, structures and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type.
        // Type Method: Classes, structures and enumerations can also define type method, which are associated with the type itself.
        
        
        /*----------------- 1. Instance Methods -----------------*/
        print("/*----------------- 1. Instance Methods -----------------*/ \n")
        
        // Definitation: Instance methods -- functions that belong to instances of a particular class, structure, or enumeration. 
        
        // They support the functionality of those instances through:
        //      1. Providing ways to access and modify instance properties.
        //      2. providing functionality related to the instance's purpose
        
        // Syntax: Same as functions
        // An instance method has implicit access to all other instance methods and properties of that type.
        // An instance method can be called only on a specific instance of the type it belongs to. It cannot be called in isolation without an existing instance.
        
        class Counter {
            // variable property
            var count = 0
            // instance method 1
            func increment(){
                count += 1
            }
            // instance method 2
            func increment(by amount: Int){
                count += amount
            }
            // instance method 3
            func reset(){
                count = 0
            }
            
        }
        
        // calling the instance method
        let counter = Counter()
        print(counter.count)
        
        counter.increment()
        print(counter.count)
        
        counter.increment(by: 5)
        print(counter.count)
        
        counter.reset()
        print(counter.count)

        
        /*----------------- 2. The Self Property -----------------*/
        print("/*----------------- 2. The Self Property -----------------*/ \n")
        
        // Definitation: Every instance of a type has an implicit property called self, which is exactly equivalent to the instance itself. We use the self property to refer to the current instance within its own instance method
        
        // then the increment() method in the example above coule have been written like this:
        
//        func increment(){
//            self.count += 1
//        }
        
        // We dont need to write self in the code very often, because Swift assumes that you are referring to a property or method of the current instance whenever you use a know property or method name within a method. Thats why we only use "count" instead of "self.count"
        
        // When use self. : When a parameter name for an instance method has the same name as a property of that instance. -> In this situation, the parameter name takes precedence, and it becomes necessary to refer to the property in a more qualified way. Here use self property to distinguish between the prameter name and the property name. as example below:
        
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOf(x: Double) -> Bool {
                // self.x referes to the property inside Point
                // x referes to the parameter this function takes
                return self.x > x
            }
        }
        
        let somePoint = Point(x: 4.0, y: 5.0)
        if somePoint.isToTheRightOf(x: 1.0){
            print("This point is to the right of the line where x == 1.0")
        }
        print("the point is now at (\(somePoint.x), \(somePoint.y))")
        
        /*----------------- 3. Modifying Value Types  -----------------*/
        print("/*----------------- 3. Modifying Value Types from Within Instance Methods -----------------*/ \n")
        
        // Structures and enumerations are value types. By default, the properties of a value type cannot be modified from within its instance methods.
        
        // However, if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method. The method can then mutate(change) its properties from within the method, and any changes that it makes are written back to the original structure when the method end. The method can also assign a completely new instance to its implicit self property, and this new instance will replace the existing one when the method ends.
        
        // Use opt behavior by placing "mutating" keyword before the func keyword for that method
        
        struct Point2{
            var x = 0.0, y = 0.0
            // This function did : moves a Point instance by a certain amount, Instaead of returning a new point, this method actually modifies the point on which it called, the "mutating" keyword is added to its definition to enable it to modify its properties.
            mutating func moveBy(x deltaX: Double, y deltaY: Double){
                x += deltaX
                y += deltaY
            }
        }
        
        var somePoint2 = Point2(x: 1.0, y: 1.0)
        somePoint2.moveBy(x: 2.0, y: 3.0)
        print("the point is now at (\(somePoint2.x), \(somePoint2.y))")
     
        /*----------------- 4. Assigning to self Within a Mutating Method  -----------------*/
        print("/*----------------- 4. Assigning to self Within a Mutating Method -----------------*/ \n")
        
        // Mutating method can assign an entirely new instance to the implicit self property. Therefore the Point2 example shown above could have been written in the following way instead:
        struct Point3{
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double){
                self = Point3(x: x + deltaX, y: y + deltaY)
            }
        }
        
        // Mutating methods for enumerations can set the implicit self parameter to be a different case from the same enumeration:
        enum TriStateSwitch {
            case off, low, high
            mutating func next(){
                switch self {
                case .off:
                    self = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }
        
        var ovenLight = TriStateSwitch.low
        print(ovenLight)
        
        ovenLight.next()
        print(ovenLight)
        
        ovenLight.next()
        print(ovenLight)
        
        
        /*----------------- 5. Type Methods -----------------*/
        print("/*----------------- 5. Type Methods -----------------*/ \n")
        
        // Instance methods: are called on an instance of a particular type. You can also define methods that are called on the type itself -- Type method. 
        // How to use it: You indicate type methods by writing the "static" keyword before the method's func keyword. Classes may also use the class keyword to allow subclasses to override the superclass's implementation of that method.
        
        // Type-level methods can be defined for all classes, structures, and enumeration. Each type method is expliciitly scoped to the type it supports.
        
        // How to use: Type methods are called with dot syntax, like instance methods. However, you call type methods on the type, not on an instance of that type.
        
        class SomeClass{
            class func someTypeMethod(){
                print("calling type method: someTypeMethod()")
                // Within the body of a type method, the implicit "self" property refers to the type iteself, rather than an instance of that type. This means that you can use "self" to disambiguate between type properties and type method parameters, just as you do for instance properties andinstance method parameters.
                
                // Any unqualifed method and property names that you use within the body of a type method will refer to other type-level methods and properties. A type method can call another type method with the other method's name, without needing to prefix it with the type name.
            }
        }
        
        SomeClass.someTypeMethod()
        
        struct LevelTracker {
            // Type property
            static var highestUnlockedLevel = 1
            // Instance property
            var currentLevel = 1
            
            // Type function
            static func unlock(_ level: Int){
                if level > highestUnlockedLevel{
                    highestUnlockedLevel = level
                }
            }
            // Convenience type function
            static func isUnlocked(_ level: Int) -> Bool {
                return level <= highestUnlockedLevel
            }
            
            // Two function above can access highestUnlockedLevel type property without the need to write LevelTracker.highestUnlockedLevel.
            
            // Instance method
            @discardableResult // Because its not necessarily a mistake for code that calls the advance(to:) method to ignore the return value, this function marked with @discardableResult
            mutating func advance(to level: Int) -> Bool {
                if LevelTracker.isUnlocked(level){
                    currentLevel = level
                    return true
                } else {
                    return false
                }
            }
            
        }
        
        // **********************************/
        // * Type function can access Type property directelly.
        // * Instance Method manage Instance property directly.
        //   Instance Method access type function within the same class need to use the className.typeFunctionName
        // **********************************/
        
        class Player{
            var tracker = LevelTracker()
            let playerName: String
            func complete(level: Int){
                // static func unlock(_ level: Int)               -- Type method
                LevelTracker.unlock(level + 1)
                // mutating func advance(to level: Int) -> Bool { -- instance method
                tracker.advance(to: level + 1)
            }
            
            init(name: String){
                playerName = name
            }
        }
        
        let player = Player(name: "Argyrios")
        player.complete(level: 1)
        print("highest unlocked leve is now \(LevelTracker.highestUnlockedLevel)")
        
        let player2 = Player(name: "Beto")
        if player2.tracker.advance(to: 6){
            print("player is now on level 6")
        } else {
            print("level 6 has not yet been unlocked")
        }
        
    }
    
}






























