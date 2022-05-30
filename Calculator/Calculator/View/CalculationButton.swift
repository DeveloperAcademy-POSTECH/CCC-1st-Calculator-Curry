//
//  CalculationButton.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

struct CalculationButton: View {
    let buttonType: ButtonType
    
    var body: some View {
        Button {
            
        } label: {
            setButtonText(buttonType)
        }
        .buttonStyle(
            CalculatorButtonStyle(buttonType: buttonType)
        )
    }
}

struct CalculationButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculationButton(buttonType: ButtonType.numbers("0"))
    }
}

extension CalculationButton {
    
    func setButtonText(_ buttonType: ButtonType) -> Text {
        switch buttonType {
        case .numbers(let string):
            return Text(string)
            
        case .operators(let string):
            return Text(Image(systemName: string))
            
        case .etc(let string):
            if string == "AC" { return Text(string) }
            return Text(Image(systemName: string))
        }
    }
    
}
