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
            setButtonText(buttonType)
        }
        .buttonStyle(
            CalculatorButtonStyle(buttonType: buttonType)
        )
    }
}

extension CalculationButton {
    
    func setButtonText(_ buttonType: ButtonType) -> Text {
        switch buttonType {
        case .numbers(let type):
            return Text(type.rawValue)
            
        case .operators(let type):
            return Text(Image(systemName: type.rawValue))
            
        case .etc(let type):
            if type == .AC {
                if calculator.isTouchedNumberPad {
                    return Text("C")
                } else {
                    return Text(type.rawValue)
                }
            }
            return Text(Image(systemName: type.rawValue))
        }
    }
    
}
