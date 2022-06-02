//
//  ButtonView.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

struct ButtonView: View {
    let spacing = 15.0
    let buttons: [[ButtonType]] = [
        [.etc("AC"), .etc("plus.forwardslash.minus"), .etc("percent"), .operators("divide")],
        [.numbers("7"), .numbers("8"), .numbers("9"), .operators("multiply")],
        [.numbers("4"), .numbers("5"), .numbers("6"), .operators("minus")],
        [.numbers("1"), .numbers("2"), .numbers("3"), .operators("plus")],
        [.numbers("0"), .numbers("."), .operators("equal")]
    ]
    
    var body: some View {
        ForEach(buttons, id: \.self) { row in
            HStack(spacing: spacing) {
                ForEach(row, id: \.self) { buttonValue in
                    CalculationButton(buttonType: buttonValue)
                }
            }
            .padding(EdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0))
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
