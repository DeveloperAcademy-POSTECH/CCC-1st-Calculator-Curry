//
//  ButtonView.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var calculator: Calculator
    
    let spacing = 15.0
    let buttons: [[ButtonType]] = [
        [.etc(.AC), .etc(.SignChanger), .etc(.Percentage), .operators(.Divide)],
        [.numbers(.seven), .numbers(.eight), .numbers(.nine), .operators(.Multiply)],
        [.numbers(.four), .numbers(.five), .numbers(.six), .operators(.Subtract)],
        [.numbers(.one), .numbers(.two), .numbers(.three), .operators(.Add)],
        [.numbers(.zero), .numbers(.dot), .operators(.Equal)]
    ]
    
    var body: some View {
        ForEach(buttons, id: \.self) { row in
            HStack(spacing: spacing) {
                ForEach(row, id: \.self) { buttonValue in
                    CalculationButton(calculator: calculator, buttonType: buttonValue)
                }
            }
            .padding(EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
        }
    }
}
