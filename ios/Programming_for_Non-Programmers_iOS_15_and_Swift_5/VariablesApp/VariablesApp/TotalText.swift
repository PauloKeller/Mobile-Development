//
//  TotalText.swift
//  VariablesApp
//
//  Created by Paulo Vinicius Keller on 1/20/23.
//

import SwiftUI

struct TotalText: View {
    var value: String = "0"
    var body: some View {
        Text(value)
            .font(.system(size: 60))
            .fontWeight(.light)
            .padding()
            .foregroundColor(.white)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
            .background(.black)
    }
}
