//
//  8_Enumerations.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-01.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Enumeration{
    class func Syntax(){
        
        // Basic definaton
        enum CompassPoint{
            case north
            case south
            case east
            case west
        }
        
        // Multiple case can appear on the single line
        enum Planet{
            case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
        }
        
        // Each enumeration definition defines a brand new type. 
        // Variable name start with capital letter.
        
        // Give enumeration types singular rather then plural names
        var directionToHead = CompassPoint.west
        
        // Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax
        directionToHead = .east
    }
    
    class func EnumWithSwitch(){
        
        enum CompassPoint{
            case north
            case south
            case east
            case west
        }
        
        var directionToHead = CompassPoint.south
        
        // Switch statement for a enum must considering all enumertion's cases.
        // If its not appropriate to provide a case for every enumeration cases, a default case is needed to cover any cases that are not addressed explicitly
        
        switch directionToHead{
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("Watch out for penguins")
        case .east:
            print("Where the sun rises")
        case .west:
            print("Where the skies are blue")
        }
    }
    
    class func AssociatedValues(){
        
        // It is useful to be able to store associated values of other types alongside these case values. This enables you to store additional custom information along with the case value, and permits this information to vary each time you use that case in your code.
        
        // Define the type of associated values
        enum Barcode{
            case upc(Int, Int, Int, Int)
            case qrCode(String)
        }
        // init a upc variable
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        // change the value of the variable to qrcode instance
        productBarcode = .qrCode("abcdefghijklmnop")
        
        // Constants and Variable of type Barcode can store either a .upc or a .qrCode together with their associated values, but they can only store one of the at any given time.
        
        // Check the instance of Barcode type and extract its value
        switch productBarcode{
        case .upc(let numberSystem, let manufacturer, let product , let check):
            print("UPC:\(numberSystem), \(manufacturer), \(product), \(check).")
        case . qrCode(let productCode):
            print("QRCode: \(productCode)")
        }
    }
    
    class func RawValues(){
        
        // Enum cases can prepopulated with default values(raw values), which are all of the same type
        enum ASCIIControCharacter: Character{
            case tab = "\t"
            case line = "\n"
            case carriageReturn = "\r"
        }
        
        // Raw values are not the same as associated values. They are set to prepopulated values when you first define the enumeration in your code. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration's cases, and can be different each time you do so.
        
        /*-------Implicitly Assigned Raw Values-------*/
        
        //When you are working with enumerations that store integer or string raw values, you dont have to explicitly assign a raw value for each case, When you dont, swift will automatically assign the values for you
        
        // When integers are used for raw values, the implicit value for each case is one more than the previous case. If the fist case doesnt have a value set, its value is 0
        
        enum Planet: Int{
            case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
        }

        let venus = Planet.venus.rawValue
        let mars = Planet.mars.rawValue
        print(venus) //2
        print(mars)  //4
        
        enum CompassPoint: String {
            case north, south, east, west
        }
        let west = CompassPoint.west.rawValue
        print(west) //"west"
        
        /*-------Initializing From a Raw Value-------*/
        print("/*-------Initializing From a Raw Value-------*/")
        
        // if you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type(as a parameter called rawValue) and returns either an enumeration case or nil. You can use this initializer to try to create a new instance of the enumeration
        
        let possiblePlanet = Planet(rawValue: 7)
        print(possiblePlanet) //Optional(static Swift3_1_Study.Enumeration.(RawValues () -> ()).(Planet #1).uranus)
        // Failable initializer: Not all possible int(for initialize a new variable of enum) value will find a matching planet, however, because of this, the raw value initializer always return an optional enumeration case.
        
        let positionToFind = 11
        if let somePlanet = Planet(rawValue: positionToFind){
            
            switch somePlanet{
            case .earth: print("Mostly harmless")
            default: print("Not a safe place for humans")
            }
        } else {
            
            print("There isnt a planet at position \(positionToFind)")
        }
        
        
        /*-------Recursive Enumerations + Recursive functions-------*/
        print("/*-------Recursive Enumerations-------*/ \n")
        
        // Recursive Enumerations: an enumeration that has another instance of the enumeration as the associate value for one or more of the enumeration cases.
        // Indicated that an enumeration case is recursive by writing "indirect" before it, which tells the compiler to insert the necessary layer of indirection
        
        enum ArithmeticExpression{
            case number(Int)
            indirect case addition(ArithmeticExpression, ArithmeticExpression)
            indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
        }
        
        // Write "Indirect" before the beginning of the enumeration, to enable indirection for all of the enumeration's cases that need it
        indirect enum ArithmeticExpression2 {
            case number(Int)
            case addition(ArithmeticExpression2, ArithmeticExpression2)
            case multiplication(ArithmeticExpression2, ArithmeticExpression2)
        }
        
        // Create (5 + 4) * 2
        let five = ArithmeticExpression2.number(5)
        let four = ArithmeticExpression2.number(4)
        let sum = ArithmeticExpression2.addition(five, four)
        let product = ArithmeticExpression2.multiplication(sum, ArithmeticExpression2.number(2))
        
        // Recursive function is a strightforward way to work with data that has a recursive structure.
        
        func evaluate(_ expression: ArithmeticExpression2) -> Int {
            switch expression{
            case let .number(value): return value
            case let .addition(left, right): return evaluate(left) + evaluate(right)
            case let .multiplication(left, right): return evaluate(left) * evaluate(right)
            }
        }
        
        print(evaluate(product)) //18
    }
}































