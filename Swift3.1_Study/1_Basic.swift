//
//  Basic.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-05.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Basic {
    class func main(){

            //--------------------------------------------------------------------------------------//
            // 1. Type Aliases
            typealias AudioSample = UInt16
            
            var maxAmplitudeFound = AudioSample.min
            var minUint16 = UInt16.min
            
            //--------------------------------------------------------------------------------------//
            // 2. Tuples
            //  Tuples group mltiple values into a single compound value. The values within a tuple can be of any type and do not have to be of the same type as each other
            
            let http404Error = (404, "Not Found")
            
            let(statusCode, statusMessage) = http404Error
            
            print("The status code is \(statusCode)")
            print("the status message is \(statusMessage)")
            
            // ignore part of the tuple value when you dont need them
            let(justTheStatusCode, _) = http404Error
            print("Only care about the status code: \(justTheStatusCode)")
            
            // access tuple's individual value using index numbers starting at zero
            print("value at index 0 : \(http404Error.0)")
            
            // Name elements inside tuple
            let http200Status = (statusCode: 200, description: "OK")
            print("http200Status.sttusCode: \(http200Status.statusCode)")
            
            //--------------------------------------------------------------------------------------//
            // 3. Optional
            
            let possibleNumber = "123"
            let convertedNumber = Int(possibleNumber) // when convert a string to int, it returns an optional value
            
            // 3.1 Unwrapp with If statement
            
            if convertedNumber != nil{
                print("convertedNumber contains some integer value: \(convertedNumber!)")
            }
            
            // 3.2 Unwrapp with Optional Binding
            
            if let actualNumber = Int(possibleNumber){
                print("possibleNumber: \"\(possibleNumber)\" has integar value of \(actualNumber) ")
            } else {
                print("possibleNumber could not be converted to an integer")
            }
            
            // Adding much more condition to optional binding
            
            if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100{
                print("\(firstNumber) < \(secondNumber) < 100")
            }
            
            // 3.3 Implicitly Unwrapped Optionals:
            // These optional variable will always have a value, after that value is first set -> it is useful to remove the need to check and unwrap the optional's value every time it is accessed.
            // Primary use: during class initialization.
            
            
            let possibleString: String? = "An optional string."
            // This one requires a exclamation mark
            let forcedString: String = possibleString!
            
            let assumedString: String! = "An implicitly unwrapped optional string."
            // This one no need for an exclamation mark
            let implicitString: String = assumedString
            
            //--------------------------------------------------------------------------------------//
            // 4. Error Handling
            
            
            // 4.1: "throws": It indicates that it can throw an error
            
            func canThrowAnError() throws{
                // This function may or may nt throw an error
            }
            
            // 4.2: Automatically propagates error out of current scope untill  they are handled by a "catch" clause
            
            
            //do {
            //    try makeASandwich()
            //    eatASandwich()
            //    // no error thrown
            //} catch SandwichError.outOfCleanDish {
            //    // an error was thrown
            //    washDishes()
            //} catch SandwichError.missingIngredients(let ingredients){
            //    buyGroceries(ingredients)
            //}
            
            
            //--------------------------------------------------------------------------------------//
            // 5. Assertions:
            // When its not possible for your code to continue execution if a particular condition is not satisfied. -> you trigger an assertion in the code to end current execution and provide an opportunity to debug the cause of this absent/invalid value
            
            // 5.1 Debugging with Assertions:
            // Use assertion whenever a condition has the potential to be false, but must definitely be true in order for your code to continue excution
            let age = 3
            // let age = -3
            assert(age >= 0, "A person's age cannot be less than zero")
            
    
    }
}
