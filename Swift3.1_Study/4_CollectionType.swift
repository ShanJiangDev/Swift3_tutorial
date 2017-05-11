//
//  CollectionType.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-05.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation

class CollectionType {
    class func main(){
        // Generic types and collections: can only use the predefined type
    }
    
    class func array(){
        //--------------------------------  1. Definitation --------------------------------//
        // An array stores values of the same type in an ordered list. Same value can appear in an array multiple times at different positions.
        
        // Array can be written in full as Array<Element> --- Element is the type of values of the array
        //              can also writes as Array[Element]
        
        //--------------------------------  2. Initialization --------------------------------//
        // 2.1 initialized empty array with certain type
        let _ = [Int]()
        
        // 2.2 Initialized array with default value
        let threeDoubles = Array(repeating: 0.0, count: 3)
        print(threeDoubles)
        
        // 2.3 Initialized array by adding two arrays together
        let anotherThreeDoubles = Array(repeatElement(1.1, count: 3))
        let sixDoubles = threeDoubles + anotherThreeDoubles
        print(sixDoubles)
        
        // 2.4 Creating array with an Array literal
        var shoppingList = ["Eggs", "Milk"]
        
        //--------------------------------  3. Accessing and Modifying Array --------------------------------//
        
        // 3.1 Length
        print("The shopping list contains \(shoppingList.count) items")
        
        // 3.2 isEmpty
        if shoppingList.isEmpty{
            print("The shopping list is empty")
        } else {
            print("The shopping list is not empty")
        }
        
        // 3.3 Add new item to the end of array
        shoppingList.append("Flour")
        print("\(shoppingList)")
        
        // 3.4 Add two array together
        shoppingList += ["Suger"]
        print("\(shoppingList)")
        
        // 3.5 Use subscript syntax to change existed value at a given index
        shoppingList[2...3] = ["Bananas", "Apples"]
        print("\(shoppingList)")
        
        // 3.6 Adding and removing item, the length of the array will be adjust accrodingly
        shoppingList.insert("Maple Syrup", at: 0)
        print("\(shoppingList)")
        
        shoppingList.remove(at: 0)
        print("\(shoppingList)")
        
        let apples = shoppingList.removeLast()
        print(apples)
        print(shoppingList)
        
        // 3.7 Interation Over an array
        // Receive both integer index of each item as well as its value
        for (index, value) in shoppingList.enumerated(){
            print("Item \(index + 1): \(value)")
        }
        
    }
    
    class func sets(){
        //--------------------------------  1. Defination --------------------------------//
        
        // Set stores distinc values of the same type in a collection with no defined ordering.
        // Use a set instead of an array when the order of item is not important || an item only appears once
        
        //--------------------------------  2. Hash Values for Set Types --------------------------------//
        // Set only store the Hashable value -- the type must provide a way to compute a hash value for itsefl
        // All swift's basic types: String, Int, Double, Bool are hashable by default
        //                          Enumeration case values without associated values are also hashable by default.
        
        //--------------------------------  3. Initialization --------------------------------//
        print("//----------   3. Initialization ---------- //")
        // 3.1 Create an empty set of a certain type using initializer syntax
        let letters = Set<Character>()
        print("Letters is of type Set<Character> with \(letters.count) items.")
        
        // 3.2 Create a set with an array literal, must write keyword "Set"
        var favourateGeners: Set = ["Rock", "Classical", "Hip hop"]
        
        //--------------------------------  4. Access & Modifying Set --------------------------------//
        print("//----------   4. Access & Modifying Set ---------- //")
        let numberOfFavourateGeneras = favourateGeners.count
        print(numberOfFavourateGeneras)
        
        // 4.2 Add new item into set
        favourateGeners.insert("Jazz")
        print(favourateGeners)
        
        // 4.3 Remove item from set
        // .remove    --- will remove the item if it is a member of the set, and return the removed value or nil if the set did not contain it.
        // .removeAll --- remove all items in the set
        
        if let removedGenre = favourateGeners.remove("Rock"){
            print("\(removedGenre)? I'm over it.")
        }else{
            print("I never much cared for that")
        }
        
        // 4.4 Check if the set contains a particular item
        if favourateGeners.contains("Funk"){
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here")
        }
        
        // 4.4 Iterating Over a set
        for genre in favourateGeners{
            print("\(genre)")
        }
        
        
        //--------------------------------  5. Set Operations --------------------------------//
        print("//----------  5. Set Operations ---------- //")
        
        let oddDigits: Set = [1,3,5,7,9]
        let evenDigits: Set = [0,2,4,6,8]
        let singleDigitPrimeNumber: Set = [2,3,5,7]
        
        // 5.1 Fundamental Set Operations
        
        // Union: create a new set with all of the values in both sets
        print(oddDigits.union(evenDigits).sorted())
        
        // Intersection: Create a new set with only the values common to both sets
        print(oddDigits.intersection(evenDigits).sorted())
        
        // Subtracting: Create a new set with values not in the specified set
        print(oddDigits.subtracting(singleDigitPrimeNumber).sorted())
        
        // SymmetricDifference: Create a new set with values in either set, but not both
        print(oddDigits.symmetricDifference(singleDigitPrimeNumber).sorted())
        
        // 5.2 Membership and Equality
        
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        // isSubset(of: ): Determine whether all of the values of a set are contained in the specified set
        print(houseAnimals.isSubset(of: farmAnimals))
        
        // isSuperset(of: ): Determine whether a set contains all of the values in a specified set
        print(farmAnimals.isSuperset(of: houseAnimals))
        
        // isDisjoint(with:) Determine whether two sets have no values in common
        print(farmAnimals.isDisjoint(with: cityAnimals))
    }
    
    class func dictionaries(){
        //--------------------------------  1. Defination --------------------------------//
        
        // Dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering.
        // Each value is associated with a unique key
        // No specified order
        
        //--------------------------------  2. Initialization --------------------------------//
        print("//-------- 2. Shorthand Syntax -------- //")
        
        // 2.1 Creating an empty dictionary with certain type
        var namesOfIntegers = [Int: String]()
        namesOfIntegers[16] = "sixteen"
        print(namesOfIntegers)
        
        // 2.2 Empty an existed dictionary
        namesOfIntegers = [:]
        print(namesOfIntegers)
        
        // 2.3 Creating a dictionary with a Dictionary Literal
        
        // Original    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        // When initialize dictionary with existed value, type keyword is not needed
        // ---->
        var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
        print(airports)
        
        //--------------------------------  3. Accessing and Modify Dictionary --------------------------------//
        print("//-------- 3. Accessing and Modify -------- //")
        // 3.1 .count: Number of items in a Dictionary
        print("The airport dictionary contains\(airports.count)")
        
        // 3.2 .isEmpty
        if airports.isEmpty{
            print("The airports dictionary is empty")
        } else {
            print("The airports dictionary is not empty")
        }
        
        // 3.3 add new item into dictionary
        airports["LHR"] = "London"
        print(airports)
        
        // 3.4 use subscript syntax to change the value associated with a particular key
        airports["LHR"] = "London Heathrow"
        print(airports)
        
        // 3.5 .updateValue has the same functionality as 3.3 and 3.4
        // but this method returns the old value after performaing an update
        // ---> check whether or not an update took place
        airports.updateValue("London", forKey: "LHR")
        print(airports)
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
            print("The old value for DUB was:   \(oldValue)")
            print("The new value for DUB is :   \(airports["DUB"])")
        }
        
        // 3.6 Subscript Syntax --> retrive a value from the ictionary for a particular key
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airpot dictionary")
        }
        
        // 3.7 Subscript Syntax --> remove a key-value pair from a dictionary by assigning a value of nil
        airports["APL"] = "Apple International"
        print(airports)
        airports["APL"] = nil
        print(airports)
        
        // 3.8 Remove a key-value pair with: removeValue(forKey:)
        if let removedValue = airports.removeValue(forKey: "DUB"){
            print("The removed airport's name is \(removedValue)")
        } else {
            print("The airport dictionary doesnt contain a value for DUB")
        }
        
        //--------------------------------  4. Iterating Over a Dictionary --------------------------------//
        print("//-------- 4. Interating -------- //")
        
        // 4.1 Retrive key-value pair
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        // 4.2 Retrive only key values from dictionary
        for airportCode in airports.keys{
            print("Airport code: \(airportCode)")
        }
        
        for airportName in airports.values{
            print("Airport name: \(airportName)")
        }
        
        // 4.3 Store all the keys or values in an array
        let airportCodes = [String](airports.keys)
        print(airportCodes)
        
        let airportNames = [String](airports.values)
        print(airportNames)
        
    }
    
}















































