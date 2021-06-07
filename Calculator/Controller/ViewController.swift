//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets & Properties
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let displayText = displayLabel.text, let number = Double(displayText) else {
                fatalError("🚨 !!!Cannot convert display label text to Double.!!! 🚨")
            }
            return  number
        }
        set {
            displayLabel.text = "\(newValue)"
        }
    }
    
    // MARK: - ViewController Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions: Private
    @IBAction
    private func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        // locale variable, its only accessible for 'calcButtonPressed' method scope { }
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("🚨 !!!The result of the calculation is nil!!! 🚨")
            }
            displayValue = result
        }
    }
    
    @IBAction
    private func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
