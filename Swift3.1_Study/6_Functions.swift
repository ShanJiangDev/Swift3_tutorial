//
//  6_Functions.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-08.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Functions{
    
    class func parametersAndReturnValue(){
        //--------------------------------  DefineAndCall --------------------------------//
        print("\n//-------- DefineAndCall -------- //")
        
        func greet(person: String) -> String {
            let greet = "Hello, " + person + "!"
            return greet
        }
        
        func greetAgain(person: String) -> String {
            return "Hello again " + person
        }
        
        //print(greet(person: "Shan"))
        
        func greet(person: String, alreadyGreeted: Bool) -> String {
            if alreadyGreeted{
                return greetAgain(person: person)
            } else {
                return greet(person: person)
            }
        }
        
        print(greet(person: "Tim", alreadyGreeted: true))
        print(greet(person: "Tooom", alreadyGreeted: false))
        
        //--------------------------------  MultipleReturnValue --------------------------------//
        print("\n//-------- MultipleReturnValue -------- //")
        
        // Return values can be access directelly with ".parameterName"
        
        func minMax(array: [Int]) -> (min: Int, max: Int) {
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count]{
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        
        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
        print("min is \(bounds.min), max is \(bounds.max)")
        
        //--------------------------------  Optional Tuple Return Types --------------------------------//
        print("\n//-------- Optional Tuple Return Types -------- //")
        // When the tuple type to be returned from a function has the potential to have "no value" for the entire tupl
        
        func minMax2(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty { return nil }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count]{
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        
        // Use optional binding to check whether this version of the minMax() fnction returns an actual tuple value or nil
        if let bounds = minMax2(array: [8, -6, 2, 109, 3, 71]){
            print("min is \(bounds.min) and max is \(bounds.max)")
        }
        
        //--------------------------------  Argument Labels and Parameter Names --------------------------------//
        print("\n//-------- Argument Labels and Parameter Names -------- //")
        // Each parameter has both an argument label and a parameter name.
        // The argument label is used when calling the function
        // Parameter name is used in the implementation of the function.
        
        func greet2(person: String, from hometown: String) -> String {
            // Use argument labels can allow a function to be called in an expressive, sentence-like maner
            return "Hello \(person)! Glad you could visit from \(hometown)"
        }
        
        print(greet2(person: "Shan", from: "HaiKou"))
        
        //--------------------------------  Omitting Argument Labels --------------------------------//
        print("\n//-------- Omitting Argument Labels -------- //")
        // If you dont want an argument label for a parameter, write an underscroe "_" instead.
        
        func someFunction(_ firstParameterName: Int, secondParameterName: Int){
            print("firstParameterName: \(firstParameterName), secondParameterName: \(secondParameterName)")
        }
        someFunction(10, secondParameterName: 1)
        
        //--------------------------------  Default Parameter Values --------------------------------//
        print("\n//-------- Default Parameter Values -------- //")
        // When calling the function with a default value parameter, if calling didnt defined the value for this parameter -> use default value, otherwise use the defined value from the calling method.
        // Always place parameters that dont have default values at the beginning of a function's parameter list, before the parameters that have default value
        
        func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12){
            print("parameterWithoutDefault: \(parameterWithoutDefault), parameterWithDefault: \(parameterWithDefault)")
        }
        
        someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6)
        someFunction2(parameterWithoutDefault: 111)
        
        //--------------------------------  Variadic Parameters --------------------------------//
        print("\n//-------- Variadic Parameters -------- //")
        // Variadic parameter: accepts zero or more values of a specified type. You use a variadic parameter to specify that the parameter can be passed a varying number of input values when the function is called
        
        func arithemticMean (_ numbers: Double...) -> Double {
            // This variadic parameter: _number can accept 0 ... Many variable within the same type Double
            var total : Double = 0
            for number in numbers {
                total += number
            }
            
            return total / Double(numbers.count)
        }
        
        print(" arithemticMean: \(arithemticMean(1,2,3,4,5))")
        
        print(" arithemticMean: \(arithemticMean(1,1,1,1,1))")
        
        //--------------------------------  In-Out Parameters --------------------------------//
        print("\n//-------- In-Out Parameters -------- //")
        // Be able to change the parameter's value and make these changes to persist after the function call has ended
        
        // Initialized: Only use variable as the argument for an in-out parameter.
        // Can not: pass a constant or a literal value as the argument
        
        // Can not have a default value.
        
        func swapTwoInts(_ a: inout Int, _ b: inout Int){
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        swapTwoInts(&someInt, &anotherInt)
        print("someInt is now \(someInt), and anotherInt is noe \(anotherInt)")
    }
    
    class func FunctionTypes(){
        //--------------------------------  Function Types --------------------------------//
        print("\n//-------- Function Types -------- //")
        
        
        func addTwoInts(_ a:Int, _ b: Int) -> Int {
            return a + b
        }
        
        func multiplyTwoInts(_ a:Int, _ b: Int) -> Int {
            return a * b
        }
        
        //--------------------------------  Variable Using Function Types --------------------------------//
        print("\n//-------- Using Function Types -------- //")
        // Use function types like any other types in Swift, and assign an appropriate function to that variable
        
        // mathFunction() and addTwoInts() have the ame type
        var mathFunction: (Int, Int) -> Int = addTwoInts
        
        print("Result: \(mathFunction(2,3))")
        
        mathFunction = multiplyTwoInts
        print("Result: \(multiplyTwoInts(2,3))")
        
        // When initialize a function type, you dont need to specify the type also
        let anotherMathFunction = addTwoInts
        print("Result: \(anotherMathFunction(2,3))")
        
        //--------------------------------  Function Types as Parameter Types --------------------------------//
        print("\n//-------- Function Types as Parameter Types -------- //")
        // Use a function type such as (Int, Int) -> Int as a parameter type for another function. 
        // Enables: to leave some aspects of a function's implementation for the function's caller to provide when the function is called.
        
        func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int){
            print("Result: \(mathFunction(a,b))")
        }
        // We can ignore parameter name when their argument name is "_"
        printMathResult(addTwoInts, 3, 3)
    
        //--------------------------------  Function Types as Return Types --------------------------------//
        print("\n//-------- Function Types as Return Types -------- //")
        // Use a function type as the return type of another function
        // Do this by: writie a complete function type immediately after the return arrow of the returning function
        
        func stepForward(_ input: Int) -> Int{
            return input + 1
        }
        
        func stepBackward(_ input: Int) -> Int {
            return input - 1
        }
        // Complete function type: (Int) -> Int
        func chooseStepFunction(backward: Bool) -> (Int) -> Int {
            return backward ? stepBackward : stepForward
        }
        
        var currentValue = 3
        
        let moveNearToZero = chooseStepFunction(backward: currentValue > 0)
        
        print("Count to zero: ")
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearToZero(currentValue)
        }
        print("zero!")
        
        //--------------------------------  Nested Functions --------------------------------//
        print("\n//-------- Nested Functions -------- //")
        // Nested Functions: hidden from the outside world by default, But still can be called and used by their enclosing function.
        // Enclosing function can also return one of its nested function to allow the nested function to be used in another scope
        
        func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
            func stepForward(input: Int) -> Int {return input + 1}
            func stepBackward(input: Int) -> Int {return input - 1}
            return backward ? stepBackward : stepForward
        }
        
        var currentValue2 = -4
        let moveNearToZero2 = chooseStepFunction2(backward: currentValue2 > 0)
        while currentValue2 != 0{
            print("\(currentValue2)")
            currentValue2 = moveNearToZero2(currentValue2)
        }
        print("zero!")

    }

}












































