//
//  9_ClassesAndStructures.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-02.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class ClassAndStructures{
    
    class func CompareClassStructure(){
        
        // Clases and structures are general-purpose, flexible constructs. They have exactly the same syntax as for constants, variables and functions
        
        // Interface: When you define a class or a structure in a single file, and the external interface to that class or structure is automatically made available for other code to user 
        
        // Both Classes and Structures has these features
        // 1. Define properties to store values
        // 2. Define methods to provide functionality
        // 3. Define subscripts to provide access to their values using subscript syntax
        // 4. Define initializers to set up their initial state
        // 5. Be extended to expand their functionality beyond a default implementation
        // 6. Conform to protocols to provide standard functionality of a certain kind
        
        // Class have additional capabilities that structures do not:
        // 1. Inheritance enables one class to inherit the characteristics of another.
        // 2. Type casting enables you to check and interpret the type of a class instance at runtime
        // 3. Definitializer enable an instance of a class to free up any resources it has assigned
        // 4. Reference counting allows more than one reference to a class instance.
        
        // Structure have additional capabilities that Class do not:
        // 1. Memberwise initializers: Initialize a new instance of structure with given value for its default properties.  check -- "4. Memberwise Initializers for Structure Types"
        //      Structure - Value Type
        //      Class     - Reference Type
        
        /*-----------------------1. Definition Syntax-----------------------*/
        
        // new Class and Structure 's name:    UpperCamelCase
        // Their properties and methods' name: lowerCamelCase
        
        // Classes and structures have a similr definition syntax
        
        struct Resolution{
            var width = 0
            var height = 0
        }
        
        class VideoMode{
            var resolution = Resolution()
            var interlaced = false
            var frameRate = 0.0
            var name: String?
        }
        
        /*-----------------------2. Class and Structure Instances-----------------------*/
        
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        
        /*-----------------------3. Accessing Properties----------------------*/
        
        // Access the initial values of someResolution.width property
        print("The width of someResolution is \(someResolution.width)")
        
        // Access into sub-Properties
        someVideoMode.resolution.width = 1280
        print("the width of someVideoMode is \(someVideoMode.resolution.width)")
        
        /*-----------------------4. Memberwise Initializers for Structure Types----------------------*/
        
        // Initialize a new instance of structure with given value of its Properties
        
        // All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name
        
        let vga = Resolution(width: 640, height: 480)
        
        // Class initializer: can not receive a default memberwise initializer.
        
        /*-----------------------5. Structures and Enumerations Are Value Types----------------------*/
        print("/*-----------------------5. Structures and Enumerations Are Value Types----------------------*/")
        // Value Type. a type whose value is copied when it is assigned to a variable or constant, or when it is passed to a function.
        
        // All structures and enumerations are value type -> Any struecture and enumeration instances you create and any value types they have as properties are always copied when they are passed around in your code
        
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        
        // Because Resolution is a struecture, a copy of the existing instance is made, and this new copy is assigned to cinema. Even though hd and cinema now have the same width and height, they are two completely different instances behind the scenes.
        
        print(cinema.width)
        cinema.width = 2048
        print("cinema new width: \(cinema.width)")
        print("hd original width: \(hd.width)")
        
        // cinema: a copy of "hd". Therefore after cinema get a new value, the value stored in hd keep still
        
        enum CompassPoint{
            case north, south, east, west
        }
        
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection
        currentDirection = .east
        
        if rememberedDirection == .west{
            print("The remembered direction is still .west")
        }
        
        // enum has the same rules as sturecture. When a copy of an enum's instance is made, this new copy will have no more relationship with the original variable
        
        /*-----------------------6. Classes Are Reference Types----------------------*/
        print("/*-----------------------6. Classes Are Reference Types----------------------*/")
        // Unlike value types, Reference Types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same exiting instance is used instead.are
        
        // 1. Declares a new constant "tenEighty" and sets its to refer to a new instance of the VideoMode class
        
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        // 2. create  new variable and sign tenEighty to it 
        let alsoTenEighty = tenEighty
        print("tenEighty original frameRate: \(tenEighty.frameRate)")
        print("alsoTenEighty original frameRate: \(alsoTenEighty.frameRate)")
        
        alsoTenEighty.frameRate = 30.0
        print("tenEighty new frameRate: \(tenEighty.frameRate)")
        print("alsoTenEighty new frameRate: \(alsoTenEighty.frameRate)")
        
        // alsoTenEighty and tenEighty are declared as constants, rather than variables. However, you can still change tenEighty.frameRate and alsoTenEighty.frameRate --> because the values of the tenEighty and alsoTenEighty constants themselves do not actually change. tenEighty and alsoTenEighty themselves do not "store" the VideoMode instance --instead, they both refer to a VideoMode instance behind the scenes.
        // Changes happened at: the frameRate property of the underlying VideoMode, Not the values of the constant references to the VideoMode
        
        // Once the property of a class instance changed, all the instance of the class change together -> because the properties of the class it self has changed.
        
        
        /*-----------------------7. Identity Operators----------------------*/
        print("/*-----------------------7. Identity Operators----------------------*/")
        // Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes.
        // -----This rule doesnt work for structures and enumberations. because they are always copied when they are assigned to a constant or variable, or passed to a function. 
        
        // To find out if two constants or variables refer to exactely the same instance of a class. 
        // Identical to " ==="
        // Not identical to "!=="

        if tenEighty === alsoTenEighty{
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }
        
        // "===" Identical to: Two constants or variables of class type refer to exactly the same class instance.
        // "==" Equal to     : Two instances are considered "equal" or "equivalent" in value, for some appropriate meaning of "equal", as defined by the type's designer.
        
        /*-----------------------8. Pointer----------------------*/
        print("/*-----------------------8. Pointer----------------------*/")
        
        // A Swift constant or variable that refers to an instance of some REFERENCE TYPE(class) is similar to a pointer inC, but is not a direct pointer to an address in mempry, and does not require you to write an *
        
        /*-----------------------9. Choosing Between Classes and Structures----------------------*/
        print("/*-----------------------9. Choosing Between Classes and Structures----------------------*/")
        
        // General guidline, consider creating a structure when one or more of these conditions apply:
        
        // Structure is a value type, and Class is a reference type
        
        // 1. The structure's primary purpose is to encapsulate a few relatively simple data values. 
        // 2. It is reasonable to expect that the encapsulated values will be copied rather than referenced when you assign or pass around an instance of that structure. 
        // 3. Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced. 
        // 4. The structure does not need to inherit properties or behavior from another existing type
        
        /*------10. Assignment and Copy Behavior for Strings, Arrays, and Dictionaries------*/
        print("/*------10. Assignment and Copy Behavior for Strings, Arrays, and Dictionaries------*/")
        
        // String, Array and Dictionary are implemented as structures. -> these data are copied when they are assigned to a new constant or variable, or when they are passed to a function or method. -- Value type
        // NSString, NSArray, NSDictionary are implemented as classes, not structures. -- Reference Type

    }
}




































