//
//  7_Closure.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-08.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Closures {
    
    // Closure: a self-contained blocks of functionality that can be passed around and used in your code.
    // Closing Over --- Can capture and store reference to any constants and variables from the context in which they are defined.
    
    // Closure forms:
    // 1. Global functions ---      are closures that have a name and do not capture any value
    // 2. Nested functions ---      are closures that have a name and can capture values from their enclosing function
    // 3. Closure expressions ----  are unnamed closures written ina lightweight syntax that can capture values value from                  their surrounding context
    
    class func closureExpressions(){
        //--------------------------------  Closure Expressions --------------------------------//
        print("\n//-------- Closure Expressions -------- //")
        
        //--------------------------------  1. Sorted Method --------------------------------//
        print("\n//-------- 1. Sorted Methods -------- //")
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        
        var reversedNames = names.sorted(by: backward)
        
        print(reversedNames)
        
        //--------------------------------  2. Closure Expression Syntax --------------------------------//
        print("\n//-------- 2. Closure Expression Syntax -------- //")
       
        
        // { (parameters) -> return type in
        //              statements
        // }
        
        // Closure expression version of the backward function
        // Inline-closure
        reversedNames = names.sorted(by:{ (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        
        //--------------------------------  3. Inferring Type From Context --------------------------------//
        print("\n//-------- 3. Inferring Type -------- //")
        
        // Because the sorting closure is passed as an argument to a method, swift can infer the types of its parameters and the type of the value it returns.
        // The sorted(by:) method is being called on an array of strings, so its argument must be a function of type (string, string) -> Bool, so these types do not need to be written as part of the closure expression's definition
        
        reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})
        
        // Its always possible to infier the parameter types and return type when passing a closure to a function or method as an inine closure expression.
        
        
        //-------------  4. Implicit Returns from Single-expression Closures  -------------//
        print("\n//-------- 4. Implicit Returns from Single-expression Closures -------- //")
        // Single-expression closures can implicity return the result of their single expresion by omitting the return keyword from their declaration.
        // Remove the "return" keyword
        
        reversedNames = names.sorted(by: {s1, s2 in s1 > s2})
        
        // Beause the sorted() methodäs argument makes it clear that a bool value must be returned by the closure. Because the closure body contain "s1 > s2" that returns a Bool value, there is no ambiguity, and the return keyword can be omitted.
        
        //-------------  5. Shorthand Argumetn Names  -------------//
        print("\n//-------- 5. Shorthand Argumetn Names -------- //")
        // Shorthand argument names to inline closures, which can be used to refer to the values of the closure's arguments by the names: $0, $1, $2
        
        // When use these shorthand argument in the closure expression
        // 1. You can omit the closure's argument list from its definition -> The number and typs of the shorthand argument names will be inferred from the expected function type
        // 2. "in" keyword can also be omitted, because the closure expression is made up entirely of its body
        
        reversedNames = names.sorted(by: {$0 > $1})
        
        //-------------  6. Operator Methods  -------------//
        print("\n//-------- 6. Operator Methods -------- //")
        
        // Swift's string type defines it string-specific implementation of the greter than operator(>) as a method that has two parameters of type string, and returns a value of type Bool. -> This exactly matches the method type needed by the sorted() method
        // ----> we can only pass in the greater-than operator, and Swift will infer that you want to use its string-specific implementation
        reversedNames = names.sorted(by: >)
    }
    
    class func traillingClosure(){
        //--------------------------------  Trailing Closures  --------------------------------//
        print("\n//-------- Trailing Closures -------- //")
        
        // When: Pass a closure expression to a function as the function's final argument and the closure expression is too long.
        // Where: A trailing closure is written after the function call's parentheses.
        // How to use: When you use the trailing closure syntax, you don't write the argument label for the closures as part of the function call.
        
        func someFunctionThatTakesAClosure(closure: () -> Void){
            // Function body goes here
        }
        
        // Here you call someFunctionThatTakesAClosure() without using a trailing closure
        someFunctionThatTakesAClosure(closure: {
            // closure's body goes here
        })
        
        // Here you call this function with a trailing closure instead:
        someFunctionThatTakesAClosure() {
            // trailing closure's body goes here
        }
        
        // Use trailing closure for the reversedName() from upon
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        var reversedName = names.sorted(){ $0 > $1}
        
        // When a closure expression is provided as the function or method's ONLY argument and you provide that expression as a trailing closure, "()" can be ommited.
        reversedName = names.sorted{ $0 > $1 }
        
        //--------------------------------  Trailing Closures with map  --------------------------------//
        print("\n//-------- Trailing Closures with map -------- //")
        let digitName = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        // map() calls the closure expression once for each item in the array named numbers
        let strings = numbers.map{ (number) -> String in
            var number = number
            var output = ""
            repeat{
                output = digitName[number % 10]! + output
                number /= 10
            } while number > 0
            print(output)
            return output
        }
        
    }
    
    class func capturingValues(){
        //--------------------------------  Capturing Values  --------------------------------//
        print("\n//-------- Capturing Values -------- //")
        
        // Closure can capture constants and variables from the surrounding context in which it is defined.
        // The closure can then refer to and modify the vlaues of those constants and variables from within its body.
        
        
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            
            var runningTotal = 0
            
            print("start running total: \(runningTotal)")
            
            func incrementer() -> Int {
                
                print("inside closure runningTotal: \(runningTotal)")
                print("inside closure amount: \(amount)")
                
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        // incrementer() captured two reference of: runningTotal and amount from the surrounding context
        // and use them within its own function body.
        // Capturing by reference ensures that runningTotal and amount do not disappear when the call to makeIncrementer end. and also ensure that runningTotal is available the next time the incrementer function is called.
        print(incrementByTen())
        print(incrementByTen())
        
        let incrementByTwo = makeIncrementer(forIncrement: 2)
        
        print(incrementByTwo())
        print(incrementByTwo())
        
        print(incrementByTen())
    }
    
    class func ClosuresAreReferenceTypes(){
        
        //--------------------------------  Closures Are Reference Type  --------------------------------//
        print("\n//-------- Closures Are Reference Type -------- //")
        
        
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            
            var runningTotal = 0
            
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        
        print(incrementByTen())
        print(incrementByTen())
        
        // From the example above, incrementByTen and incrementByTwo are constants, but the closures these constants refer to are still able to increment the "runningTotal" variable that they have captured ----> because functions and closures are reference types. 
        // So when we asssign a closure to two differenct constants (example below), both of these constants will refer to the same closure:
        
        let alsoIncrementByTen = incrementByTen
        
        // Here both "alsoIncrementByTen" and "incrementByTen" refering to the same closure, so they both useing the value form the same reference type
        
        print(alsoIncrementByTen())
        
    }
    
    class func escapingClosures(){
        //--------------------------------  Excaping Closures  --------------------------------//
        print("\n//-------- Excaping Closures -------- //")
        
        // Where to use: When declare a function that takes a closures as one of its parameters, you can write @escaping efore the parameter's type --> to indicate that the closure is allowed to escape
        
        // How to use: a closure can escape is by being stored in a variable that is defined outside the function:
        
        // The function returns after it starts the operation, but the closure isn't called untill the operation is completed -> the closure need to escape, to be called later
        
//        var completionHandlers: [() -> Void] = []
//        func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//            completionHandlers.append(completionHandler)
//        }
        
        //----------------------------------------------------------------//
       
/*
         // Example check escapingClosures.playground
         //: Playground - noun: a place where people can play
         
         import UIKit
         
         var str = "Hello, playground"
         
         var completionHandlers: [() -> Void] = []
         
         func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
            completionHandlers.append(completionHandler)
         }
         
         func someFunctionWithNonescapingClosure(closure:() -> Void){
            closure()
         }
         
         class SomeClass{
            var x = 10
         
            func doSomething(){
         
                someFunctionWithEscapingClosure {
                    self.x = 100
                }
         
                someFunctionWithNonescapingClosure {
                    x = 200
                }
            }
         
         
         }
         
         let instance = SomeClass()
         instance.doSomething()
         print(" with no escaping closure: \(instance.x)")
         
         completionHandlers.first?()
         print(" with no escaping closure: \(instance.x)")

*/
    }
    
    class func autoClosure(){
        // Auto closure lets you delay evaluation, because the code inside isn't run until you call the closure.Delaying evaluation is useful for code that has side effects or is computationally expensive, because it lets you control when that code is evaluated.
        
        //-----------Use a function with no parameters for returnning a string-----------//
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        
        let customerProvider = { customersInLine.remove(at: 0)}
        print(customersInLine.count)
        
        //customersInLine.remove(at: 0) run now after call the next line
        print("Now serving \(customerProvider())!")
        print(customersInLine.count)
        
        //-----------Use a closure as an arguent to a function returnning a string-----------//
        
        func serve(customer customerProvider2: () -> String){
            print("Now serving \(customerProvider2())!")
        }
        serve(customer: {customersInLine.remove(at: 0)})
        print(customersInLine.count)
        
        //-----------Taking an autoclosure by marking its parameters type-----------//
        

        func serve2(customer customerProvider3: @autoclosure () -> String){
            print("Now serving \(customerProvider3())")
        }
        // Now you can call the function as if it took a String argument instead of a closure. The argument is automatically converted to a closure. Because the customerProvider3 parameter's type is marked with the @autoclosure attribute
        serve2(customer: customersInLine.remove(at: 0))
        print(customersInLine.count)

        //-----------@autoclosure & @escaping-----------//
        var customerProviders : [() -> String] = []
        
        func collectCustomerProviers(_ customerProvider4: @autoclosure @escaping () -> String){
            customerProviders.append(customerProvider4)
        }
        
        collectCustomerProviers(customersInLine.remove(at: 0))
        collectCustomerProviers(customersInLine.remove(at: 0))
        
        // now both completions are stored inside customerProviders
        print("Collected \(customerProviders.count) closures.")
        
        for customerProvider in customerProviders{
            print("Now serving \(customerProvider())!")
            print(customersInLine.count)
        }
    }
}



































