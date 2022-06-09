//
//  ContentView.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var calculator = Calculator()
    
    var body: some View {
            VStack {
                Spacer()
                
                Text(String(calculator.displayNumber))
                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .padding()
            
                ButtonView(calculator: calculator)
            }
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
