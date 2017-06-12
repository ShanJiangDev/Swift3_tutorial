//
//  14_Initialization.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-08.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Initialization{
    class func initialization(){
        /*----------------- 1. Initialization -----------------*/
        print("/*----------------- 1. Initialization  -----------------*/ \n")
        
        // Definitation: The process of preparing an instance of a class, structure, or enumeration for use.
        //  This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before the new instance is ready for use
        
        // Useage: Do not return value, their primary role is to ensure that new instances of a type are correctly initialized before they are used for the first time.
        
        // Instances of class types: can also implement a deinitializer, which performs any custom cleanup just before an instance of that class is deallocated.
        
        /*----------------- 2. Setting Initial Values for Stored Properties -----------------*/
        print("/*----------------- 2. Setting Initial Values for Stored Properties  -----------------*/ \n")
        
        // Stored property: Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state
        
        // How:
        // 1. Set an initial value for a stored property within an initializer --- 3. Initializers ----
        // 2. By assigning a default property value as part of the property's definition. ---- 4. Default Property Values -----
        // (These two ways are set that property directly, without calling any property observers)
        
        /*----------------- 3. Initializers -----------------*/
        print("/*----------------- 3. Initializers  -----------------*/ \n")
        
        // Definitation: Initializers are called to create a new instance of a particular type. In its simplest form, an initializer is like an instance method with no parameters.
        /*
        init(){
            // Perform some Initialization here
        }
         */
        
        struct Fahrenheit{
            var temperature: Double
            // A single initializer, with no parameters, which initializes the stored "temperature" with a value of 32.0
            init(){
                temperature = 32.0
            }
        }
        
        let f = Fahrenheit()
        print("The default temperature is \(f.temperature)° Fahrenheit")
     
        
        /*----------------- 4. Default Property Values -----------------*/
        print("/*----------------- 4. Default Property Values  -----------------*/ \n")
        
        // Initial value of a stored property: you specify a default property value by assigning an initial value to the property when it is defined.
        
        // When: the property always takes the same initial value. In this situation provide a default vaue rather than setting a value within an initializer.
        // Why: The results are the same, 
        //  1. but the default value ties the property's initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value.
        //  2. The default value also makes it easier for you to take advantage of default initializers and initializer inheritance
        
        struct Fahrenheit2 {
            var temperature = 32.0
        }
        
        /*----------------- 5. Customizing Initialization -----------------*/
        print("/*----------------- 5. Customizing Initialization  -----------------*/ \n")
        
        // Definitation: You can customize the initialization process with :
        // 1. Input parameters and Optional property types        ---- 5.1, 5.2, 5.3, 5.4
        // 2. Assigning constant properties during initialization.---- 5.5
        
        /*----------------- 5.1 Initialization Parameters -----------------*/
        print("/*----------------- 5.1 Initialization Parameters  -----------------*/ \n")
        
        // Definitation: You can provide initialization parameters as part of an initializer's definition, to define the types and names of values that customize the initialization process.
        // Initialization parameters: Have the same capabilities and syntax as function and method parameters.
        
        struct Celsius {
            
            // This struct contain two custom initializers, which initialize a new instance of the structure with a value from a different temperature scale.
            
            var temperatureInCelsius: Double
            // argument label: fromFahrenheit
            // parameter name: fahrenheit
            init(fromFahrenheit fahrenheit: Double){
                temperatureInCelsius = ( fahrenheit - 32 ) / 1.8
            }
            // argument label: fromKelvin
            // parameter name: kelvin
            init(fromKelvin kelvin: Double){
                temperatureInCelsius = kelvin - 273.15
            }
            
        }
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        print("boilingPointOfWater: \(boilingPointOfWater)")
        let freezingPointWater = Celsius(fromKelvin: 273.15)
        print("freezingPointWater: \(freezingPointWater)")
        
        /*----------------- 5.2 Parameter Names and Argument Labels -----------------*/
        print("/*----------------- 5.2 Parameter Names and Argument Labels  -----------------*/ \n")
        
        // Initialization parameters: as with function and method parameters, initialization parameters can have both a parameter name for use within the initializer's body and an argument label for use when calling the initializer.
        
        // Swift provide an automatic argument label for every parameter in an initializer if you dont provide one.
        // It is not possible to call these initializers without using argument labels. Argument labels must always be used in an initializer if they are defined, and omitting them is a compile-time error

        struct Color {
            let red, green, blue: Double
            init(red: Double, green: Double, blue: Double){
                self.red = red
                self.green = green
                self.blue = blue
            }
            
            init(white: Double){
                red = white
                green = white
                blue = white
            }
        }
        
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        let halfGray = Color(white: 0.5)
        
        /*----------------- 5.3 Initializer parameters without Argument Labels -----------------*/
        print("/*----------------- 5.3 Initializer parameters without Argument Labels  -----------------*/ \n")
        
        // If you do not want to use an argument label for an initializer parameter, wrtie an "_" instead of an explicit argument label for that parameter to override the default behavior.
        
        struct Celsius2 {
            var temperatureInCelsius : Double
            init(fromFahrenheit fahrenheit: Double){
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double){
                temperatureInCelsius = kelvin - 273.15
            }
            init(_ celsius: Double){
                temperatureInCelsius = celsius
            }
        }
        
        let bodyTemperature = Celsius2(37.0)
        print("bodyTemperature: \(bodyTemperature.temperatureInCelsius)")
        
        /*----------------- 5.4 Optional Property Types -----------------*/
        print("/*----------------- 5.4 Optional Property Types  -----------------*/ \n")
        
        // Definitation: If your custom type has a stored property that is logically allowed to have "no value" - perhaps because its value cannot be set during initialization, or because it is allowed to have "no value" at some later point - declare the property with an option type.
        // Properties of option type: Are automatically initialized with a value of nil, indicating that the property is deliberately intended to have "no value yet" during initialization
        
        class SurveyQuestion {
            var text: String
            // Reason to be optional: The response to survey question cannot be know until it is asked, and so this property declared as optional. It automatically assigned a default value of nil when a new instance of SurveyQuestion is initialized.
            var response: String?
            init(text: String){
                self.text = text
            }
            func ask(){
                print(text)
            }
        }
        let cheeseQuestion = SurveyQuestion(text: "Do you like chese?")
        cheeseQuestion.ask()
        
        cheeseQuestion.response = "Yes, i do like chese"
        
        /*----------------- 5.5 Assigning Constant Properties During Initialization -----------------*/
        print("/*----------------- 5.5 Assigning Constant Properties During Initialization  -----------------*/ \n")
        
        // Definitation: You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes. Once a constant property is assigned a value, it cant be further modify
        
        // Class instance: a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass.
        
        // Revise the SurveyQuestion example from above to use a constant property rather than a variable property for the "text" property of the question, to inidcate that the question does not change once an instance of SurveyQuestion is created. Even though the text property is a constant, it can still be set within the class's initializer:
        
        class SurveyQuestion2 {
            let text: String
            var response: String?
            init(text: String){
                //You can assign a value to a constant property at any point during initialization, as long as it is set to a definite value by the time initialization finishes.
                self.text = text
            }
            func ask(){
                print(text)
            }
        }
        
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        
        /*----------------- 6. Default Initializers -----------------*/
        print("/*----------------- 6. Default Initializers  -----------------*/ \n")
        
        // For Structure or Class that provides default value for all of its properties and does not provide at least one initializer itself.
        // The default initializer simply creates a new instance with all of its properties set to their default value.
        
        class ShoppingListItem{
            var name: String?
            var quantity = 1
            var purchased = false
        }
        
        var item = ShoppingListItem()
        // Because all properties of the "ShoppingListItem" class have default value, and because it is a base class with no superclass. "ShoppingListItem" automatically gains a default initialier implementation that creates a new instance with all of its properties set to their default value. (Optional property automatically receives a default value of nil)
        
        
        /*----------------- 6.1 Memberwise Initializers for Structure Types -----------------*/
        print("/*----------------- 6.1 Memberwise Initializers for Structure Types  -----------------*/ \n")
        
        // Definitation: Structure types automatically receive a "memberwise initializer" if they do not define any of their own custom initializer. It is a shorthand way to initialize the member properties of new structure instance. Initial value for the properties of the new instance can be passed to the memberwise initializer by name
        
        // Structure        -    Memberwise Initializer: Even if it has stored properties that do not have default value
        // Structure/Class  -    Default Initializer: All properties should provide initialization
        
        struct Size {
            // This structure has two properties with default value
            var width = 0.0, height = 0.0
            // This structure automatically receives an init(width:height:) memberwise initializer, which you can use to initialize a new Size instance
        }
        let twoByTwo = Size(width: 2.0, height: 2.0)
        
        /*----------------- 7. initializer Delegation for Value Type -----------------*/
        print("/*----------------- 7. initializer Delegation for Value Type  -----------------*/ \n")
        
        // Initializer Delegation: Initializers can call other initializers to perform part of an instance's initialization -- to avoid duplicating code across multiple initializers.
        
        // Value Types(structures and enumeration) do not support inheritance, and so their initializer delegation process is relatively simple, because they can only delegate to another initializer that they provide themselves.
        // How: use "self.init" to refer to other initializers from the same value type when writing your own custom initializers.
        // When: You can call "self.init" only from within an initializer
        // * if you define a custom initializer for a value type, you will no longer have access to the default initializer(or the memberwise nitializer, if it is a structure) for that type ---- This prevents a situation in which additional essential setup provide in a more complex initializer is accidentally circumvented by someone using on of the automatic initializers.
        // * If you want your custom value type to be initializeable with the default initializer and memberwise initializer, and also with your own custom initializers, write your custom initializer in an EXTENSION rather than as part of the value type's original implementation.
        
        // Reference Type(classes) can inherit from other classes, which means they have additional responsibilities for ensuring that all stored properties they inherit are assigned a suitable value during initialzation.
        
        struct Point {
            var x = 0.0, y = 0.0
        }


        struct Rect {
            var origin = Point()
            var size = Size()
            init(){}
            init(origin: Point, size: Size){
                self.origin = origin
                self.size = size
            }
            init(center: Point, size: Size){
                let originX = center.x - (size.width/2)
                let originY = center.y - (size.height/2)
                self.init(origin: Point(x: originX, y: originY), size: size)
            }
        }
        
        
        // There are 3 ways t initializ the React structure below:
        // 1. Useing default zero-initialized "origin" point and "size" property value
        //      This is functionally the same as the default initializer that the structure would have received if it did not have its own custom initializer. It has an empty body, represented by an empty pair of curly braces {}. Calling this initializer returns a React instance whose "origin" and "size" properties are both initialized with the default values of Point(x: 0.0, y: 0.0) and Size(width: 0.0, height: 0.0)
        let basicRect = Rect()
        print("basicReact.origin: \(basicRect.origin), basicReact.size: \(basicRect.size)")
        
        // 2. Providing a specific origin point and size
        //      This is functionally same as the memberwise initializer that the structure would have received if it did not have its own custom initializer. This initializer simply assigns the origin and size argument values to the appropriate stored properties
        let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
        print("originRect.origin: \(originRect.origin), originRect.size: \(originRect.size)")
        
        // 3. Providing a specific center point and size
        //      Customized initializer, it starts by calculating an appropriate origin point based on a center point and a size value. It then calls/delegates to the init(origin:size:) initializer, which stores the new origin and size values in the appropriate properties:
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
        print("centerRect.origin: \(centerRect.origin), centerRect.size: \(centerRect.size)")
        
        /*----------------- 7. Class Inheritance and Initialization -----------------*/
        print("/*----------------- 7. Class Inheritance and Initialization  -----------------*/ \n")
        
        // All of a class's stored properties -- includinig any properties which inherit from its superclass -- must be assigned an initial value during initialization.
        
        // Two kinds of initializers for class type to help ensure all stored properties receive an initial value.
        // 1. Designated Initializers
        // 2. Convenience Initializers
        
        
        /*----------------- 7.1 Designated Initializers and Convenience Initializers -----------------*/
        print("/*----------------- 7.1 Designated Initializers and Convenience Initializers  -----------------*/ \n")
        
        // Designated initializers: are the primary initializer for a class. 
        // It fully initializers all propertie introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.
        // Numebers: Class tend to have very few, and commonly only have one.
        //           Every class must have at least one designated initializer. In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass.
        
        
        // Convenience initializers: secondary, supporting initializers for a class.
        // Useage: 
        //  1. You can define a convenience intializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer's parameters set to default value.
        //  2. You can also define a convenience initializer to create an instance of that class for a specific use case or input value type.
        // When: a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent
        
        /*----------------- 7.2 Syntax for Designated Initializers and Convenience Initializers -----------------*/
        print("/*----------------- 7.2 Syntax for Designated Initializers and Convenience Initializers  -----------------*/ \n")
        
        // Designated initializer for classes:
        
//        init(parameters){
//            statements
//        }
        
        // Convenience initializers
//        convenience init(parameters){
//            statements
//        }
        
        /*----------------- 7.2 Initializer Delegation for Class Types -----------------*/
        print("/*----------------- 7.2 Initializer Delegation for Class Types -----------------*/ \n")
        
        // To simplify the relationship between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:
        // 1. a designated initializer must call a designated initializer from its immediate superclass
        // 2. a convenience initializer must call another initializer from the same class
        // 3. a convenience initializer must ultimately call a designated initializer.
        
        // Conclustion:
        // 1. Designated initializers must always delegate up.
        // 2. Convenience initializers must always delegate across.
        
        
        // These rules don't affect how users of your classes create instances of each class. 
        // Any initializer in the diagram above can be used to create a fully.initialized instance of the class they belong to. THe rules only affect how you write the implementation of the class's initializers.
        
        // --------------- SuperClass -------------
        // Designated <- Convenience <- Convenience
        // ----↑----↖︎---------------------------------
        //     |      ↖︎
        // ----|--------↖︎-- SubClass -------------
        // Designated    Designated <- Convenience
        // ----------------------------------------
        
        // Description: 
        // In superclass:it has a single designeated initializer and two convenience initializers. One convenience initializer calls another convenience initializer, which in turn calls the single designated initializers. This satisfies rule 2 and 3 from above. The superclas does not itself have a further superclass, and so rule 1 does not apply
        // In subclass: The convenience initializer must call one of the two designated initializers, because it can only call another initializer from the same class. This satisfies rules 2 and 3. Both designated initializers must call the single designated initializer from the superclass, to satisfy rule 1 from above.
        
        /*----------------- 7.3 Two-phase Initialization -----------------*/
        print("/*----------------- 7.3 Two-phase Initialization -----------------*/ \n")
        
        // Definitation: Class initialization is a two-phase process.
        // Firs phase: each stored property is assigned an initial value by the class that introduced it.
        // ---------once the initial state for every stored property has been determined, second phase begins
        // Second phase: each class is given the opportunity to customize its stored properties further before the new instance is considered ready for use.
        
        // Benefit: 
        // 1. It make initialization safe, while still giving complete flexibility to each class in a class hierarchy.
        // 2. It prevents property values from being accessed before they are initialized, and prevents property values from being set to a different value by another initializer unexpectedly.
        
        // Swift compiler performs four helpful saftty-checks to make sure that two-phase initialization is completed without error
        // Safety check 1:
    }
}






























































