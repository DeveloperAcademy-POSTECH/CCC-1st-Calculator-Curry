//
//  Operation.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/30.
//

import Foundation

class Calculator: ObservableObject {
    
    @Published var displayNumber = "0"
    
    var isTouchedOperation = false
    var isTouchedEqual = false
    var isTouchedNumberPad = false
    var isTouchedDot = false
    var isTouchedSignChanger = false
    
    var displayNumberContainer = ""
    var operationContainer: [String] = []
    
    // = 을 연속으로 누를 시 계산을 위한 변수
    var lastNumber = ""
    var lastOperator = ""
    
    // only touch
    func touchButton(_ type: ButtonType) {
        switch type {
        case .numbers(let numberPad):
            touchNumberPad(numberPad)
        case .operators(let operation):
            touchOperation(operation)
        case .etc(let etcOperation):
            touchEtcOperation(etcOperation)
        }
    }
    
    // touch sevaral buttons
    func touchNumberPad(_ numberPad: NumberPad) {
        //TODO: 연속적으로 Equal 버튼 누를 시 계산되도록 로직 수정
        if isTouchedEqual {
            displayNumberContainer = ""
            operationContainer = []
            
            isTouchedNumberPad = false
            isTouchedDot = false
            isTouchedSignChanger = false
            isTouchedEqual = false
        }
        
        isTouchedNumberPad = true
        isTouchedOperation = false
        
        judgeZeroSign()
        addNumberPad(numberPad)
        
        display()
    }
    
    
    
    // Number function
    func addNumberPad(_ numberPad: NumberPad) {
        switch numberPad {
        case .dot:
            if !isTouchedDot { displayNumberContainer += numberPad.rawValue }
            isTouchedDot = true
        default:
            displayNumberContainer += numberPad.rawValue
        }
    }
    
    func touchOperation(_ operation: Operation) {
        if !isTouchedOperation {
            operationContainer.append(displayNumberContainer)
            lastNumber = displayNumberContainer
            addOperation(operation)
        }
        
        isTouchedDot = false
        isTouchedOperation = true
        
        displayNumberContainer = ""
    }
    
    func touchEtcOperation(_ etcOperation: EtcOperation) {
        switch etcOperation {
        case .AC:
            ac()
        case .SignChanger:
            changeSign(isTouchedSignChanger)
        case .Percentage:
            makePercentage()
        }
    }
    
    
    
    // Operation functions
    func addOperation(_ operation: Operation) {
        switch operation {
        case .Add:
            add()
        case .Subtract:
            minus()
        case .Divide:
            divide()
        case .Multiply:
            multiply()
        case .Equal:
            if isTouchedEqual {
                operateAfterEqual()
            } else {
                operate()
            }
            isTouchedEqual = true
        }
    }

    func add() {
        operationContainer.append("+")
        lastOperator = "+"
    }
    
    func minus() {
        operationContainer.append("-")
        lastOperator = "-"
    }
    
    func divide() {
        operationContainer.append("/")
        lastOperator = "/"
    }
    
    func multiply() {
        operationContainer.append("*")
        lastOperator = "*"
    }
    
    func operate() {
        let number = operationContainer.reduce("") { $0 + $1 }
        print(number)
        let expression = NSExpression(format: number)
        let value = expression.expressionValue(with: nil, context: nil) as? Double
        
        displayNumber = judgeDemicalNumber(value)
    }
    
    func operateAfterEqual() {
        print("실행됨")
        let newNumber = lastNumber + lastOperator + displayNumber
        print(newNumber)
        let expression = NSExpression(format: newNumber)
        let value = expression.expressionValue(with: nil, context: nil) as? Double
        
        displayNumber = judgeDemicalNumber(value)
    }
    
    
    
    // for operate()
    func judgeDemicalNumber(_ value: Double?) -> String {
        guard let value = value else { return "" }
        
        let refinedValue = Double(Int(value))
        
        if value == refinedValue { return "\(Int(value))"}
        else { return "\(value)"}
    }
    
    
    
    // Etc functions
    func ac() {
        displayNumber = "0"
        
        isTouchedEqual = false
        reset()
    }
    
    func changeSign(_ isTouchedSignChanger: Bool) {
        if !isTouchedSignChanger {
            self.isTouchedSignChanger = true
            addZero()
            displayNumberContainer = "-" + displayNumberContainer
            display()
        } else {
            self.isTouchedSignChanger = false
            deleteMinus()
            addZero()
            display()
        }
    }
    
    func makePercentage() {
        if let number = Double(displayNumberContainer) {
            let newNumber = number / 100
            if newNumber == -0.0 {
                // -0에서 Percentage를 터치할 경우
                displayNumberContainer = "0"
            } else {
                displayNumberContainer = String(newNumber)
            }
            display()
        } else {
            // displayNumberContainer == "" 일 경우
            displayNumber = "0"
        }
    }
    
    
    
    // for changeSign()
    func addZero() {
        if displayNumberContainer == "" { displayNumberContainer += "0" }
    }
    
    func deleteMinus() {
        var newNumber = ""
        for str in displayNumberContainer { if str != "-" { newNumber += String(str) } }
        displayNumberContainer = newNumber
    }
    
    func judgeZeroSign() {
        // -0 또는 0에서 NumberPad를 터치할 시
        switch displayNumberContainer {
        case "-0":
            displayNumberContainer = "-"
        case "0":
            displayNumberContainer = ""
        default:
            return
        }
    }
    
    
    
    //history reset
    func reset() {
        isTouchedOperation = false
        isTouchedNumberPad = false
        isTouchedDot = false
        isTouchedSignChanger = false
        
        
        displayNumberContainer = ""
        operationContainer = []
        
//        lastNumber = ""
//        lastOperator = ""
    }
    
    func display() {
        displayNumber = displayNumberContainer
    }
}
