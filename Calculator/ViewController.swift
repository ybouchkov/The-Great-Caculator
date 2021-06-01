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
    
    fileprivate enum CalculatorMethods: String {
        case ac = "AC"
        case plusMinus = "+/-"
        case percent = "%"
    }
    
    // MARK: - ViewController Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions: Private
    @IBAction
    private func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let displayText = displayLabel.text {
            // locale variable, its only accessible for 'calcButtonPressed' method scope { }
            guard let number = Double(displayText) else {
                fatalError("Cannot convert display label text to Double.")
            }
            
            if let calcMethod = sender.currentTitle {
                calculateChoiceMethod(calcMethod, numValue: number)
            }
        }
    }
    
    private func calculateChoiceMethod(_ calcMethod: String, numValue: Double) {
        let method = CalculatorMethods(rawValue: calcMethod)
        switch method {
        case .ac:
            displayLabel.text = "\(0)"
        case .percent:
            displayLabel.text = "\(numValue / 100)"
        case .plusMinus:
            displayLabel.text = "\(numValue * -1)"
        default:
            fatalError("🚨 !!!Unknown functionality for this calculator!!!! 🚨:")
        }
    }

    @IBAction
    private func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}
