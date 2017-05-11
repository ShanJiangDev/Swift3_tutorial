//
//  5_ControlFlow.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-05.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation

class ControlFlow{
    class func forInLoop(){
        //--------------------------------  For loop --------------------------------//
        print("//-------- For loop -------- //")
        
        let numberOfLegs = ["spider" : 8, "ant" : 6, "cat": 4]
        for (animalName, legCount) in numberOfLegs{
            print("\(animalName)'s have \(legCount) legs")
        }
        
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power{
            answer *= base
        }
        print("answer: \(answer)")
    }
    
    class func switchLoop(){
        //--------------------------------  Switch loop --------------------------------//
        print("//-------- Switch loop -------- //")
        let someCharacter: Character = "z"
        switch someCharacter {
            case "a":
                print("The first letter of the alphabet")
            case "z":
                print("The last letter of the alphabet")
        default:
            print("Some other character")
        }
        
        //--------------------------------  1. No implicit Fallthrough --------------------------------//
        print("//-------- No implicit Fallthrough -------- //")
        let anotherCharacter : Character = "a"
        
        switch anotherCharacter {
            case "a","A":
                print("The letter A")
        default:
            print("Not the letter A")
        }
        
        //-------------------------------- 2. interval Matching --------------------------------//
        print("//-------- Interval Matching -------- //")
        // Check the switch case for their inclusion in an interval
        let approximatedCount = 62
        let countedThings = "moons orbiting Sturn"
        let nanturalCount : String
        switch approximatedCount {
        case 0:
            nanturalCount = "no"
        case 1..<5:
            nanturalCount = "a few"
        case 5..<12:
            nanturalCount = "several"
        case 12..<100:
            nanturalCount = "dozens of"
        case 100..<1000:
            nanturalCount = "hundreds of"
        default:
            nanturalCount = "many"
        }
        print("There are \(nanturalCount) \(countedThings)")
        
        //--------------------------------  3. Tuples --------------------------------//
        print("//-------- Tuples -------- //")
        // Use tuples to test multiple values in the same switch statement
        
        // _ : a wildcard to match any possible value
        let somePoint = (1,1)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        
        //--------------------------------  3. Value Bindings --------------------------------//
        print(" \n//-------- Value Bindings -------- //")
        // Name the value/values it matches to temporary constants or variables for use inisde the case-body
        
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case(let x, 0):
            print("on the x-axis with an x value of \(x)")
        case(0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        
        //--------------------------------  4. Where --------------------------------//
        print("\n//-------- Where -------- //")
        
        let yetAnotherPoint = (1, -1)
        
        switch yetAnotherPoint{
        case let(x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        
        //--------------------------------  5. Compound Cases --------------------------------//
        print("\n//-------- Compound Cases -------- //")
        
        // multiple switch cases share the same body
        
        let yetAnotherCharacter: Character = "e"
        
        switch anotherCharacter {
            case "a",  "e", "i", "o", "u":
                print("\(yetAnotherCharacter) is a vowel")
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                print("\(yetAnotherCharacter) is a consonant")
            default:
                print("\(yetAnotherCharacter) is not a vowel or a consonant")
            
        }
        
        // Compound cases combined with value binding
        
        let stillAnotherPoint = (9, 0)
        
        switch stillAnotherPoint {
        case (let distance, 0), (0, let distance):
            print("On an axis, \(distance) from the origin")
        default:
            print("Not on an axis")
        }
        
        //--------------------------------  6. Control Transfer Statement --------------------------------//
        print("\n//-------- Control Transfer Statement -------- //")
        
        // 6.1 Continue
        // This statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop
        
        let puzzleInput = "great mind think alike"
        var puzzleOutput = ""

        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        
        for character in puzzleInput.characters {
            if charactersToRemove.contains(character){
                continue
            } else {
                puzzleOutput.append(character)
            }
        }
        
        print("puzzleOutput : \(puzzleOutput)")
        
        // 6.2 Break
        // This statement ends execution of an entire control flow statement immediately.
        // Can be used inside a swtich (ignore statement) or loop statmenet.
        
        let numberSymbol : Character = "三"
        var possibleIntegerValue : Int?
        // possibleIntegerValue has nil as initial value
        
        switch numberSymbol{
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
            // Default case does not need to perform any action
        }
        
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        
        // 6.3 Fallthrow
        // Switch statement only completes its execution as sson as the first match case is completed. but not going throw all the statement --> Switch statment dont fall through the bottom of each case and into the next one
        
        // Fallthrow allowed to go through more than one switch statement
        
        // Fallthrow keyword cause code execution to move directly to the statmeent inside the next case block
        
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2,3,5,7,11,13,17,19:
            description += " a prime number, and also"
            fallthrough
        default:
            description += " an integer."
        }
        
        print(description)
        
        // 6.4 return --------> In Functions class
        // 6.5 throw  --------> In Propagating Error Using Throwing Function
        
        // 6.6 Labeled Statements ---- While
        
        // When have multiple nested loops, this statement can be used to explicit which loop to continue
        // It can be use for both "break" and "continue" keyword
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        
        gameLoop: while square != finalSquare {
            print("diceRoll: \(diceRoll)")
            diceRoll += 1
            
            if diceRoll == 7 { diceRoll = 1 }
            
            switch square + diceRoll {
            case finalSquare:
                print("Loop break")
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                print("Continue Loop")
                continue gameLoop
            default:
                print("Default case")
                print("square: \(square)")
                square += diceRoll
                print("square after added diceRoll: \(square)")
                square += board[square]
                print("square after added board[square]: \(square)")
            }
        }
        print("Game over! \n \n")
        
        // 6.7 Early Exit
        // A guard statement, like an if statement, executes stateent depending on the Bool value of an expression
        
        func greet(person: [String: String]){
            
            print("name: \(person["name"])")
            print("location: \(person["location"])")
            
            guard let name = person["name"] else {
                return
            }
            
            print("Hello \(name)")
            
            guard let location = person["location"] else {
                print("I hope the weather is nice near you")
                return
            }
            
            print("I hope theweather is nice in \(location)")
        }
    
        greet(person: ["name": "John"])
        
        greet(person: ["name": "Jane", "location": "Cupertino"])
        
        // 6.8 Check API Availability
        // Built-in support to ensures that you don't accidentaly use APIs that are unavailable on a give deployment target
        
        // To verify that all the APIs used in your code are available on the deployment target specifie by your project
        
        print("\n")
        
        if #available(iOS 10, macOS 10.12, *){
            // * refers to all the system aboved the one specified before
            print("Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS")
        } else {
            print("Fall back to earlier iOS and macOS APIs")
        }
        

    
        
    }
}






































































