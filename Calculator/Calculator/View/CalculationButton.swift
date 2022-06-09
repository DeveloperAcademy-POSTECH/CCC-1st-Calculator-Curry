//
//  CalculationButton.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

struct CalculationButton: View {
    @ObservedObject var calculator: Calculator
    
    let buttonType: ButtonType
    
    var body: some View {
        Button {
            calculator.touchButton(buttonType)
        } label: {
            CalculatorText(calculator: calculator, buttonType: buttonType)
        }
        .buttonStyle(
            CalculatorButtonStyle(buttonType: buttonType)
        )
    }
}

struct CalculatorText: View {
    @ObservedObject var calculator: Calculator
    
    let buttonType: ButtonType
    
    var body: some View {
        switch buttonType {
        case .numbers(let numberPad):
            Text(numberPad.rawValue)
            
        case .operators(let operation):
            Text(Image(systemName: operation.rawValue))
            
        case .etc(let etcOperation):
            switch etcOperation {
            case .AC:
                if calculator.isTouchedNumberPad { Text("C") }
                else { Text(etcOperation.rawValue) }
            default:
                Text(Image(systemName: etcOperation.rawValue))
            }
        }
    }
}
