//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Dara Khadjehnouri on 2022-05-25.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (operation: String, number: Double)?
    
    mutating func set(number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(calcMethod: String) -> Double? {
        if let n = number {
            switch calcMethod {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(number: n)
            default:
                intermediateCalculation = (operation: calcMethod, number: n)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(number: Double) -> Double {
        guard let safeIntermediateCalc = intermediateCalculation else {
            fatalError("Could not store operation")
        }
        switch safeIntermediateCalc.operation {
        case "+":
            return safeIntermediateCalc.number + number
        case "-":
            return safeIntermediateCalc.number - number
        case "×":
            return safeIntermediateCalc.number * number
        case "÷":
            return safeIntermediateCalc.number / number
        default:
            fatalError("Something went wrong.")
        }
    }
}
