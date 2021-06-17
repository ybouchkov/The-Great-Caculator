//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Yani Buchkov on 7.06.21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    // MARK: - Properties
    private var number: Double?
    
    fileprivate enum CalculatorMethods: String {
        case ac = "AC"
        case plusMinus = "+/-"
        case percent = "%"
    }
        
    // MARK: - Public:
    func calculate(symbol: String) -> Double? {
        return calculateChoiceMethod(symbol)
    }
    
    // MARK: - Private:
    private func calculateChoiceMethod(_ calcMethod: String) -> Double {
        let method = CalculatorMethods(rawValue: calcMethod)
        if let n = number {
            switch method {
            case .ac:
                return 0
            case .percent:
                return n * 0.01
            case .plusMinus:
                return n * -1
            default:
                fatalError("🚨 !!!Unknown functionality for this calculator!!!! 🚨:")
            }
        }
        return 0.0
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
}
