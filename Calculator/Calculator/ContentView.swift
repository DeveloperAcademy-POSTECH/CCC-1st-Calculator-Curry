//
//  ContentView.swift
//  Calculator
//
//  Created by 이재웅 on 2022/05/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("0.99999999")
                    .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
                    .padding()
            
                ButtonView()
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
