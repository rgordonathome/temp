//
//  ViewController.swift
//  CalculatorTestRun
//
//  Created by Russell Gordon on 4/27/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    var state = Calculator()        // Make a new instance of the Calculator class to keep track data
                                    // This is the "model" for the model-view-controller relationship
    
    @IBOutlet weak var display: UILabel!
    
    // MARK: Method(s) / Function(s)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onePressed(_ sender: Any) {
        state.addToNewValue(digit: "1")
        updateDisplay()
    }

    @IBAction func twoPressed(_ sender: Any) {
        state.addToNewValue(digit: "2")
        updateDisplay()
    }
    
    @IBAction func threePressed(_ sender: Any) {
        state.addToNewValue(digit: "3")
        updateDisplay()
    }
    
    @IBAction func fourPressed(_ sender: Any) {
        state.addToNewValue(digit: "4")
        updateDisplay()
    }
    
    @IBAction func fivePressed(_ sender: Any) {
        state.addToNewValue(digit: "5")
        updateDisplay()
    }

    @IBAction func sixPressed(_ sender: Any) {
        state.addToNewValue(digit: "6")
        updateDisplay()
    }
    
    @IBAction func sevenPressed(_ sender: Any) {
        state.addToNewValue(digit: "7")
        updateDisplay()
    }

    @IBAction func eightPressed(_ sender: Any) {
        state.addToNewValue(digit: "8")
        updateDisplay()
    }
    
    @IBAction func ninePressed(_ sender: Any) {
        state.addToNewValue(digit: "9")
        updateDisplay()
    }
    
    @IBAction func zeroPressed(_ sender: Any) {
        state.addToNewValue(digit: "0")
        updateDisplay()
    }
    
    @IBAction func equals(_ sender: Any) {
        printState()
        state.equals(retainOperation: false)    // Clear the operation since "=" button was pressed
        printState()
        showNewAnswer()
    }
    
    @IBAction func multiply(_ sender: Any) {
        state.multiply()
        showNewAnswer()
    }
    
    @IBAction func divide(_ sender: Any) {
        state.divide()
        showNewAnswer()
    }
    
    @IBAction func add(_ sender: Any) {
        state.add()
        showNewAnswer()
    }
    
    @IBAction func subtract(_ sender: Any) {
        state.subtract()
        showNewAnswer()
    }
    
    @IBAction func percent(_ sender: Any) {
        state.percent()
        showNewAnswer()
    }
    
    @IBAction func changeSign(_ sender: Any) {
        state.changeSign()
        updateDisplay()
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        state.clear()
        updateDisplay()
    }
    
    func updateDisplay() {
        
        // When the clear button has just been pressed
        if state.newValue == "" && state.currentValue == nil {
            
            // Show nothing in the display area
            display.text = ""
            
        } else {
            
            // When there is no new value but there is a current value, that means
            // an operation has just been performed, so, show the answer
            if state.newValue == "" {
                showNewAnswer()
            } else {
                // When there is not a current value, just a change in the new value, show
                // the new value
                display.text = state.newValue
            }

        }
        
    }
    
    func showNewAnswer() {
        
        // See whether current value can be represented as an integer
        // First verify that there is a current value to work with
        if state.currentValue != nil {
            let truncated = Double(Int(state.currentValue!))
            if state.currentValue! - truncated == 0 {
                // Show as integer, without decimals
                display.text = String(format: "%.0f", state.currentValue!)
            } else {
                // Show with decimals
                display.text = String(format: "%f", state.currentValue!)
            }
        }
    }
    
    func printState() {
        // Show the current calculator state
        print("Current value is \(state.currentValue)")
        print("New value is \(state.newValue)")
        print("Current operation is \(state.currentOperation)")
        print("===============")
    }
    
}

