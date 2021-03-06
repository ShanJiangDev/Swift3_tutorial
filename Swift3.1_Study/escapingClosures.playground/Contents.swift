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





