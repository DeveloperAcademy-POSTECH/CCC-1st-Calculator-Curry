//
//  ButtonStyle.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import SwiftUI

enum ButtonType: Hashable {
    case numbers(NumberPad)
    case operators(Operation)
    case etc(EtcOperation)
}

enum Operation: String {
    case Add = "plus"
    case Subtract = "minus"
    case Divide = "divide"
    case Multiply = "multiply"
    case Equal = "equal"
}

enum EtcOperation: String {
    case AC = "AC"
    case SignChanger = "plus.forwardslash.minus"
    case Percentage = "percent"
}

enum NumberPad: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case dot = "."
}

struct CalculatorButtonStyle: ButtonStyle {
    
    let buttonType: ButtonType
    
    private let height: CGFloat = (UIScreen.main.bounds.width - (5 * 12)) / 4
    
    private var width: CGFloat {
        switch buttonType {
        case .numbers(let type):
            if type == .zero { return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2 + 6 }
            else { return (UIScreen.main.bounds.width - (5 * 15)) / 4 }
        default:
            return (UIScreen.main.bounds.width - (5 * 15)) / 4
        }
    }
    
    private var buttonFontSize: CGFloat {
        switch buttonType {
        case .numbers:
            return 45.0
        case .operators:
            return 40.0
        case .etc:
            return 35.0
        }
    }
    
    private var buttonFontColor: Color {
        switch buttonType {
        case .etc:
            return Color.black
        default:
            return Color.white
        }
    }
    
    private var buttonColor: Color {
        switch buttonType {
        case .numbers:
            return Color(red: 64/255, green: 64/255, blue: 64/255)
        case .operators:
            return Color.orange
        case .etc:
            return Color(red: 192/255, green: 192/255, blue: 192/255)
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height, alignment: .center)
            .font(.system(size: buttonFontSize, weight: .regular))
            .foregroundColor(buttonFontColor)
            .background(
                RoundedRectangle(cornerRadius: 50)
                .fill(buttonColor)
                .frame(width: width, height: height)
            )
    }

}
