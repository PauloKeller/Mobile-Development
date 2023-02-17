//
//  ContentView.swift
//  VariablesApp
//
//  Created by Paulo Vinicius Keller on 1/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                TotalText()
                HStack {
                    CalculatorButton(buttonText: "1")
                    CalculatorButton(buttonText: "2")
                    CalculatorButton(buttonText: "3")
                    CalculatorButton(buttonText: "+", color: .orange)
                }
                HStack {
                    CalculatorButton(buttonText: "4")
                    CalculatorButton(buttonText: "5")
                    CalculatorButton(buttonText: "6")
                    CalculatorButton(buttonText: "-", color: .orange)
                }
                HStack {
                    CalculatorButton(buttonText: "7")
                    CalculatorButton(buttonText: "8")
                    CalculatorButton(buttonText: "9")
                    CalculatorButton(buttonText: "x", color: .orange)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 148)
                    CalculatorButton(buttonText: "C", color: .gray)
                    CalculatorButton(buttonText: "=", color: .orange)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
