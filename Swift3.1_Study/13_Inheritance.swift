//
//  13_Inheritance.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-08.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Inheritance {
    class func inheritance(){
        /*----------------- 1.Definitation -----------------*/
        print("/*----------------- 1.Definitation -----------------*/ \n")
        
        // Definitation for inheritance: a class can inherit methods, properties, and other characteristics from another class.
        // Subclass-SuperClass: When one class inherits from another, the inheriting class is know as subclass, and the class it inherits from is know as its superclass.
        
        // Class: can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior. Can also add property observers to inherited properties in order to be notified when the value of a property changes.
        // Property observers: can be added to any property, regardless of whether it was originally defined as a stored or computed property
        
        /*----------------- 2. Defining a Base Class -----------------*/
        print("/*----------------- 2. Defining a Base Class -----------------*/ \n")
        
        // Base Class: Any class that does not inherit from another class is known as a base class.
        
        class Vehicle {
            // Stored property with default value
            var currentSpeed = 0.0
            // Read-only computed String property
            var description: String{
                return "traveling at \(currentSpeed) miles per hour"
            }
            // This method does not actually do anything for the base Vehicle class but will be customized by subclasses of Vehicle later on
            func makeNoise(){
                // Do nothing - an arbitrary vehicle doesnt necessarily make a noise.
            }
        }
        // Create a new instance of Vehile with initializer syntax"()"
        let someVehicle = Vehicle()
        // Accessing the property
        someVehicle.currentSpeed = 10.0
        print("Vehicle: \(someVehicle.description)")
        
        /*----------------- 3. Subclassing -----------------*/
        print("/*----------------- 3. Subclassing -----------------*/ \n")
        
        // Subclassing: is the act of basing a new class on an existing class.
        // Functionality: Subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.
        
        // This Bicycle subClass automatically gains all of the characteristics of Vehicle, such as "currentSpeed", "description", "makeNoise()" method.
        // Beside the inherits characteristics, Bicucle defines new stored property "hasBasket" with a default value
        class Bicycle: Vehicle {
            var hasBasket = false
        }
        
        // By default, any new Bicycle instance you create will not have a basket. You can set the hasBasket property to true for a particular Bicucle instance after that instance is created:
        let bicycle = Bicycle()
        
        // modify subclass property
        bicycle.hasBasket = true
        
        // Modify superclass property
        bicycle.currentSpeed = 15.0
        
        print("Bicucle: \(bicycle.description) . Has basket : \(bicycle.hasBasket)")
        
        // Subclasses can themselves be subclassed.
        
        // Tandem inherits all of the properties and methods from Bicucle, which in turn inherits all of the properties and methods from Vehicle.
        // Tandem subclass also adds a new stored property "currentNumberOfPassengers" with a default value of 0
        class Tandem: Bicycle {
            var currentNumberOfPassengers = 0
        }
        // The instance of Tandom can work with any of its new and inherited properties, and query the read-only description property it inherits from Vehicles
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        print("Tandem: \(tandem.description)")
        
        /*----------------- 4. Overriding -----------------*/
        print("/*----------------- 4. Overriding -----------------*/ \n")
        
        // Definitation:
        //  Subclass can provide its own custom implementation of an instance method, type method, instance property, type property, or subscript that it would otherwise inherit from a superclass.

        /*----------------- 5. Accessing Superclass methods, Properties, and Subscripts -----------------*/
        print("/*----------------- 5. Accessing Superclass methods, Properties, and Subscripts -----------------*/ \n")

        // Ue existing implementation: When you provide a method, property, or subscript override for a subclass, it is sometimes useful to use the eexisting superclass implementation as part of your override. For example, you can refine the behavior of that existing implementation, or store a modified value in an existing inherited variable.
        
        // Access superclass: Where this is appropriate, you access the superclass version of a method, property, or subscript by using "super" prefix
        /*
        override func someMethod(){
         
         // Calling the sperclass version of someMethod()
            super.someMethod()
            print("override someMethod")
        }
         */
        
        /*----------------- 6. Overriding Methods -----------------*/
        print("/*----------------- 6. Overriding Methods -----------------*/ \n")
        
        // Why: Override an inherited instance or type method to provide a tailored or alternative implementation of the method within the subclass
        
        class Train: Vehicle{
            override func makeNoise() {
                print("Choo Choo")
            }
        }
        
        let train = Train()
        train.makeNoise()
        
        /*----------------- 7. Overriding Prperties -----------------*/
        print("/*----------------- 7. Overriding Prperties  -----------------*/ \n")
        
        // Why: Override an inherited instance or type property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes
        // How:
        //  1. Provide a custom getter (and setter, if appropriate) to override any inherited property, regardless of whether the inherited property is implemented as a stored or computed property at source.
        //  2. Must always state both the name of the type of that property you are overridng, to enable the compiler to check that your override mathches a superclass property with the same name and type.
        //  3. You can present an inherited read-only property -> read-write property.
        //     You can not present an inherited read-write property -> read-only property.
        
        // 3.1 When you provide a setter as part of property override, you must also provide a getter for the override. If you dont want to modify the inherited property's value within the overriding getter, use: super.someProperty from the getter, where someProperty is the name of the property you are overriding.
        
        class Car: Vehicle{
            var gear = 1
            
            // Overriding the "description" property it inherits from Vehicle, to provide a custom description that includes the current "gear"
            override var description: String{
                return super.description + " in gear \(gear)"
            }
        }
        
        let car = Car()
        car.currentSpeed = 25.0
        car.gear = 3
        print(car.description)
        
        
        /*----------------- 7. Overriding Prperty Observers -----------------*/
        print("/*----------------- 7. Overriding Prperty Observers  -----------------*/ \n")
        
        // How: You can use property overriding to add property observers to an inherited property.
        // Why: This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.
        
        // Can Not: add property observers to
        // 1. inherited constant stored properties
        // 2. inherited read-only computed properties.
        // Value of these two properties cannot be set, and so it is not appropriated to provide a willSet or didSet implementation as part of an override.
        
        // Can Not: add both an overriding setter and an overriding property observer for the same property. Because if you want to observe changes to a property's value, the customer setter for that property already can do this job.
        
        class AutomaticCar: Car {
            override var currentSpeed: Double {
                // Whenever you set the "currentSpeed" property of an AutomaticCar instance, the this didSet observer sets the instance's "gear" property to an appropriate choice of gear for the new speed.
                didSet{
                    gear = Int(currentSpeed/10) + 1
                }
            }
        }
        
        /*----------------- 8. Preventing Overrides -----------------*/
        print("/*----------------- 8. Preventing Overrides  -----------------*/ \n")
        
        // How: Prevent a method, property, or subscript from being overridden by making it as final(at superclass definition or at extension's definition).
        // eg. final var, final func, final class func, final subscript
        
        // Any attempt to override a final method/ property/ subscript in a subclass is reported as a compile-time error.
        
        // Entire class: You can mark an entire class as final. Any attempt to subclass a final class is reported as a compile-time error.
    }
}




























