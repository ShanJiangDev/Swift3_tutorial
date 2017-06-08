//
//  12_Subscripts.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-06-08.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class Subscripts{
    class func subscripte(){
        
        /*----------------- 1. Subscript -----------------*/
        print("/*----------------- 1. Subscript -----------------*/ \n")
        
        // Definitation for Subscripte: Classes, structures, and enumerations can define subscripts, which are shortcuts for accessing the member elements of a collection, list, or sequence. 
        // You use subscripts to set and retrieve values by index without needing separate methods for setting and retrieval. For array, someArray[Index], for dictionary, someDictionary[Key]
        // Subscripts are not limited to a single dimnesion, and you can define subscripts with multiple input parameters to suit your custom type's needs.
        
        /*----------------- 2. Subscript Syntax -----------------*/
        print("/*----------------- 2. Subscript Syntax -----------------*/ \n")
        
        // Write subscript definitions with the "subscript" keyword, and specify one or more input parameters and a return type, in the same way as instance methods.
        // Can be read-write or read-only
        
        // 1. read-write subscript
        /*
        subscript(index: Int) -> Int {
            get {
                // return an appropriate subscript value here
            }
            // As with computed properties, you can choose not to specify the setter's (newValue) parameter. A default parameter called newValue is provided to your setting if you do not provide one yourself
            set(newValue){
         // perform a suitable setting action here
            }
        }
         */
        
        // 2. read-only subscript
        /*
        subscript(index: Int) -> Int{
            // return an appropriate subscript value here
        }
         */
        
        struct TimesTable{
            let multipler: Int
            subscript(index: Int) -> Int {
                // An n-times-table is based on a fixed mathematical rule. It is not appropriate to set threeTimesTable[[index] to a new value, and so the sbscript for TimesTable is defined as a read-only subscript.
                print("inside subscripte, index: \(index), multipler: \(multipler)")
                return multipler * index
            }
        }
        // A new instance of TimesTable is created to represent the three-times-table. This is indicated by passing a value of 3 to the structure's initializer as the value to use for the instance's multiplier parameter.
        let threeTimesTable = TimesTable(multipler: 3)
        // You can query the threeTimesTable instance by calling its subscript, as shown in the call below. This requests the sixth entery in the three-times-table, which returns a value of 18, or 3 times 6.
        print("six times three is \(threeTimesTable[6])")
        
        
        /*----------------- 3. Subscript Usage -----------------*/
        print("/*----------------- 3. Subscript Usage -----------------*/ \n")
        
        // Useage: Subscripts are typically used as a shortcut for accessing the member elements in a collecion, list, or sequence. You are free to implement subscripts in the most appropriate way for your particular class or structure's functionality.
        
        // Dictionary type implements a subscript to set and retrieve the values stroed in a Dictionary instance. 
        
        // You can set a value in a dictionary by providing a key of the dictionary's key type within subscript brackets, and assigning a value of the dictionary's value type to the subscript:
        
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        // Set value in dictionary: the line below uses subscript assignment to add a String key of "bird" and an Int value of 2 to the dictionary.
        numberOfLegs["bird"] = 2
        
        // Dictionary type implements its key-value subscripting as a subscript that takes and return and optional type.
        // Dictionary type uses an iptional subscript type to model the fact that not every key will have a value, and to give a way to delete a value for a key by assigning a nil value for that key.
        print(numberOfLegs["bird"])
        
        /*----------------- 4. Subscript Options -----------------*/
        print("/*----------------- 4. Subscript Options -----------------*/ \n")
        
        // Parameters: subscripts can take any number of input parameter, and these input parameters can be of any type.
        //              Do not take in-out parameters
        //              Do not provide default parameter values
        // Return:     Subscripts can return any type.
        
    
        // Subscript Overloading: A class or structure can rovide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the types of the value or values that are contained within the subscript brackets at the point that thte subscript is used. This definition of multiple subscripts is know as sbscript overloading.
        
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            // Initializer takes two parameters called rows and columns and creates an array that is large enough to store rows*columns values of type Double. Each position in the matrix is given an initial value of 0.0.
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(repeating: 0.0, count: rows * columns)
            }
            
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column > columns
            }
            
            subscript(row: Int, column: Int) -> Double {
                get{
                    // An assertion to check that the subscript's row and column values are valid.
                    // This assertaion will be trigered once you try to access a subscript that is outside of the matrix bounds
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set{
                    // An assertion to check that the subscript's row and column values are valid.
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
        // Creates a new Matrix instance with two rows and two columns.  The grid array for this matrix instance is effectively a flattened version of the matrix, as read from top left to botom right
        var matrix = Matrix(rows: 2, columns: 2)
        
        // grid = [0.0, 0.0, 0.0, 0.0]
        
        // Matrix = | 0.0 , 0.0 |
        //          | 0.0 , 0.0 |
        
        
        // Call the subscript's setter
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        
        // Matrix = | 0.0 , 1.5 |
        //          | 3.2 , 0.0 |
        
        // This line will trigger the accertation
        //let outOfRangeValue = matrix[2,2]
        //print(outOfRangeValue)
        
    
    }
    
    
}




























