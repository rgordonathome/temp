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
        
        updateState()
    }
    
    func divide() {
        
        // Set the operation
        currentOperation = division

        updateState()
    }

    func add() {
        
        // Set the operation
        currentOperation = addition
        
        updateState()
    }

    func subtract() {
        
        // Set the operation
        currentOperation = subtraction
        
        updateState()
    }

    func updateState() {
        
        // Set the state of the calculator as appropriate
        if currentValue == nil {
            // If new value is first value entered, it becomes currentValue right away
            makeNewValueCurrentValue()
        } else if newValue == "" {
            // do nothing
        } else {
            // If there is already a current value, perform the operation on it together with the new value
            equals()
        }
        
    }
    
    func equals() {
        
        // Perform the selected operation
        if currentOperation == multiplication {
            currentValue = currentValue! * Double(newValue)!
        } else if currentOperation == division {
            currentValue = currentValue! / Double(newValue)!
        } else if currentOperation == addition {
            currentValue = currentValue! + Double(newValue)!
        } else if currentOperation == subtraction {
            currentValue = currentValue! - Double(newValue)!
        }
        
        // The operation selected had been performed, so get ready to receive new operation
        // and new value
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
