//
//  Calculator.swift
//  CalculatorTestRun
//
//  Created by Russell Gordon on 4/27/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK: Properties
    var newValue : String = ""
    var currentValue : Double? = nil
    
    let multiplication = "Multiplication"
    let division = "Division"
    let addition = "Addition"
    let subtraction = "Subtraction"
    
    var currentOperation : String? = nil
    
    // MARK: Initializer(s)
    
    // MARK: Method(s) a.k.a. Function(s)
    func addToNewValue(digit : String) {
        self.newValue += digit
    }
    
    func multiply() {
        
        // Set the operation
        currentOperation = multiplication
        
        // If new value is first value entered, it becomes currentValue right away
        if currentValue == nil {
            makeNewValueCurrentValue()
        } else if newValue == "" {
            // do nothing
        } else {
            // If there is already a current value, multiply by new value
            equals()
        }
    }
    
    func equals() {
        if currentOperation == multiplication {
            currentValue = currentValue! * Double(newValue)!
        }
        currentOperation = nil
        newValue = ""
    }
    
    func clear() {
        // Reset everthing
        currentOperation = nil
        newValue = ""
        currentValue = nil
    }
    
    func makeNewValueCurrentValue() {
        currentValue = Double(newValue)
        newValue = ""
    }
}
