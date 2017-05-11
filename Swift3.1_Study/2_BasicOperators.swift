//
//  BasicOperators.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-05.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class BasicOperators{
    class func main(){
        //--------------------------------------------------------------------------------------//
        // 1. Operator
        
        // 1.1 compare tuples: Compare the first one from the left, when you got result then its the result for the tuple comparasion
        
        
        (1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
        (3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
        (4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog”
        
        //--------------------------------------------------------------------------------------//
        // 2. Ternary Conditional Operator:    question ? answer1 : answer2
        
        let contentHeight = 48
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
        
        //--------------------------------------------------------------------------------------//
        // 3. Nil-Coalescing Operator:       a ?? b
        
        // It unwrape an optional a if it contains a value, or returns a default value b if a is nil.
        // a ----- is always an optional tyle
        // b ----- must match the type that is stored inside a.
        
        let defaultColorName = "red"
        var userDefinedColorName: String? // default to nil
        
        var colorNameToUse = userDefinedColorName ?? defaultColorName
        // Because userDefinedColorName is nil. so colorNameToUse is set to the default of "red"
        
        //--------------------------------------------------------------------------------------//
        // 4. Range Operators
        
        // 4.1: Closed Range Operator:    (a...b)
        // Defines the range runs from a to be, and includes the values of a and b
        
        for index in 1...5{
            print("\(index) times 5 is \(index * 5)")
        }
        
        // 4.2: Half-Open Range Operator:  (a..<b)
        // Defines the range runs from a to be, but not include b
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count{
            print("Person \(i+1) is called \(names[i])")
        }
        
        
        // 4.3 Combining Logical Operators
        //  && and
        //  || or
        //  They are left-associative -> compound expressions with multiple logical operators evaluate the leftmost subexpression first.
        
        let enterDoorCode = true
        let passedRetinaScan = false
        let hasDoorKey = false
        let knowsOverridePassword = true
        
        if enterDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
            print("we received a true answer at the end")
        } else {
            print("false answer")
        }
        
        // ->  (enterDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword

    
    }
}
