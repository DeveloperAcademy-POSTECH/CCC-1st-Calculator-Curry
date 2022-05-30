//
//  ButtonView.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

struct ButtonView: View {
    let spacing = 15.0
    
    var body: some View {
        VStack(spacing: spacing) {
            HStack(spacing: spacing) {
                CalculationButton(buttonType: ButtonType.etc("AC"))
                CalculationButton(buttonType: ButtonType.etc("plus.forwardslash.minus"))
                CalculationButton(buttonType: ButtonType.etc("percent"))
                CalculationButton(buttonType: ButtonType.operators("divide"))
            }
            
            HStack(spacing: spacing) {
                CalculationButton(buttonType: ButtonType.numbers("7"))
                CalculationButton(buttonType: ButtonType.numbers("8"))
                CalculationButton(buttonType: ButtonType.numbers("9"))
                CalculationButton(buttonType: ButtonType.operators("multiply"))
            }
            
            HStack(spacing: spacing) {
                CalculationButton(buttonType: ButtonType.numbers("4"))
                CalculationButton(buttonType: ButtonType.numbers("5"))
                CalculationButton(buttonType: ButtonType.numbers("6"))
                CalculationButton(buttonType: ButtonType.operators("minus"))
            }
            
            HStack(spacing: spacing) {
                CalculationButton(buttonType: ButtonType.numbers("1"))
                CalculationButton(buttonType: ButtonType.numbers("2"))
                CalculationButton(buttonType: ButtonType.numbers("3"))
                CalculationButton(buttonType: ButtonType.operators("plus"))
            }
            
            HStack(spacing: spacing) {
                CalculationButton(buttonType: ButtonType.numbers("0"))
                CalculationButton(buttonType: ButtonType.numbers("."))
                CalculationButton(buttonType: ButtonType.operators("equal"))
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
