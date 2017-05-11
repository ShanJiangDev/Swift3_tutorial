//
//  StringAndChars.swift
//  Swift3.1_Study
//
//  Created by shan jiang on 2017-05-05.
//  Copyright © 2017 shan jiang. All rights reserved.
//

import Foundation
class StringAndChars{
    class func main(){
        //--------------------------------  1. String: Initializing --------------------------------//
        
        // 1.1 Empty string literal
        var emptyString = ""
        
        // 1.2 Initializer syntax
        var anotherEmptyString = String()
        
        // Upon two example are equivalent to each other
        
        //--------------------------------  2. String: Value Types --------------------------------//
        
        // String type is a value type. If you create a new String value( String value is copied when it is passed to a function or method, or it is assigned to a constant or variable) -> a new copy of the existing String value is created -> the new copy is passed or asssigned, not the original version.
        
        // Copy-by-default
        
        //--------------------------------  3. Characters --------------------------------//
        
        // 3.1 Access individual Char from string
        
        for character in "Dog!🤡".characters {
            print(character)
        }
        
        // 3.2 Initialize character
        
        let exclamationMark: Character = "!"
        
        // 3.3 Characters -> String
        
        let catCharacters : [Character] = ["C", "a", "t", "!", "😅"]
        let catString = String(catCharacters)
        print("catString: \(catCharacters)")
        
        // 3.4 Concatenating Strings and Characters
        let string1 = "hello"
        let string2 = "there"
        var string3 = string1 + string2
        
        print("Concatenated string: \(string3)")
        
        // 3.5 append string to string
        var string4 = "!!!!!!"
        string4 += string3
        print("Appended string: \(string4)")
        
        // 3.6 append Character value to string
        print("string3 before appending: \(string3)")
        string3.append(exclamationMark)
        print("string3 after appending: \(string3)")
        
        // 3.7 String interpolation
        let multiplier = 3
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        print("String interpolation: \(message)")
        
        // 3.8 Special Characters in String Literals:
        print("null character:\0")
        print("backslass:\\")
        print("horizontal tab:\t")
        print("inline feed: \n")
        print("carriage return: \r")
        print("double quote: \" ")
        print("single quote: \' ")
        print("unicode: \u{1F496}")
        
        // Both of these representation qualify as a single Character value in Swift
        print("unicode: \u{D55C}") // 한, a precomposed character
        print("unicode: \u{1112}\u{1161}\u{11AB}") // ᄒ, ᅡ, ᆫ, decomposed charactor
        
        // 3.9 Counting Characters
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
        print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
        
        // When using grapheme clusters for character, string concatenation and modification may not always affect a string's character count.
        var cafe = "cafe"
        print("the number of character is \(cafe) is \(cafe.characters.count)")
        
        cafe += "\u{301}"
        print("the number of character is \(cafe) is \(cafe.characters.count)")
        
        // 3.10 String indices
        let gutenTag = "Guten Tag!"
        for index in gutenTag.characters.indices{
            print("\(gutenTag[index]) ")
        }
        print("\(gutenTag[gutenTag.startIndex])")
        print("\(gutenTag[gutenTag.index(before: gutenTag.endIndex)])")
        print("\(gutenTag[gutenTag.index(after: gutenTag.startIndex)])")
        let gutenTagIndex = gutenTag.index(gutenTag.startIndex, offsetBy: 7)
        print("\(gutenTag[gutenTagIndex])")
        
        // 3.11 String Comparason -- String and Character equality
        // When they have the same linguistic meaning and appearance, even if they are composed from different Unicode scalars behind the scenes
        let quotation = "We're a lot alike, you and I."
        let sameQuotation = "We're a lot alike, you and I."
        
        if quotation == sameQuotation {
            print("Equal string")
        }
        
        let eAcuteQuestion =         "Voulez-vous un caf\u{E9}?"
        let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
        
        if eAcuteQuestion == combinedEAcuteQuestion {
            print("Equal string")
        }
        
        // 3.11 String Comparason -- prefix equality
        // 3.11 String Comparason -- suffix equality
        // To check weather a string has a particular string prefix or suffix
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1"){
                act1SceneCount += 1
            } else if scene.hasSuffix("Capulet's mansion"){
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell"){
                cellCount += 1
            }
        }
        print("there are \(act1SceneCount) scenes in Act 1")
        print("there are \(mansionCount) masion scenes; \(cellCount) cell scenes")
        
        // 3.12 Convert string to UTF-8,16,32
        let dogString = "Dog‼🐶"
        
        for codeUnit in dogString.utf8{
            print("\(codeUnit) ", terminator: "")
        }
        print("")
        
        // 3.12 Convert string to Unicode(UInt32)
        for scalar in dogString.unicodeScalars{
            print("\(scalar.value) ")
            print("\(scalar) ")
        }

    }
}
