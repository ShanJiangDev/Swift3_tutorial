//
//  23_Generics.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-12.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation

class Generics{
    class func General(){
        //--------------------------------  General --------------------------------//
        print("\n//-------- General -------- //")
        // Enables you to write flexible, resusable functions and types that can work with any type, subject to requirement that you define. Help to avoid duplication and expresses its intent in a clear, abstracted manner.
        
        // inout: allowed to modify a parameter's value and keep these changes persist after the function call has ended.
        func swapTwoInts(_ a: inout Int, _ b: inout Int){
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var a = 10
        var b = 20
        
        swapTwoInts(&a, &b)
        print("a: \(a), b: \(b)")
        
        // We want to remove the swapTwoInts() which specific to int but create a function suitable for all types
        
        //--------------------------------  Generic Function --------------------------------//
        print("\n//-------- Generic Function -------- //")
        
        // Using a placeholder type named T instead of an actual type name (such as Int, String or Double)
        // The placeholder type name doesnt say anything about what T must be, but it does say that both a and b must be of the same type T, whatever T represents.
        // The actual type of use in place of T is determined each time the swapTwoValues(_:_:) function is called.
        func swapTwoValues<T>(_ a: inout T, _ b: inout T){
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 307
        swapTwoValues(&someInt, &anotherInt)
        print("after swaping, someInt: \(someInt), anotherInt: \(anotherInt)")
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        print("after swaping, someInt: \(someString), anotherInt: \(anotherString)")
    }
    
    class func Type(){
        //--------------------------------  Type Parameters --------------------------------//
        print("\n//-------- Type Parameters -------- //")

        // T is a type parameter.
        // Type parameter: specify and name a placeholder type, and are written immediately after the function's name, between a pair of amtching angle bracket: <T>
        // You can provide more than one type parameter by writing multiple type parameter names within the angle brackets, separated by commas. <T, A, B>
        
        
        //--------------------------------  Generic Types --------------------------------//
        print("\n//-------- Generic Types -------- //")
    }
    
}

























