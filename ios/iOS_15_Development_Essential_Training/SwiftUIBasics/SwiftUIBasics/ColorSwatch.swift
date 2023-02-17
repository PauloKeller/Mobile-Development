//
//  ColorSwatch.swift
//  SwiftUIBasics
//
//  Created by Paulo Vinicius Keller on 28/10/22.
//

import SwiftUI

struct ColorSwatch: View {
    var color: Color
    
    var body: some View {
        Image(systemName: "circle.fill")
            .foregroundColor(color)
    }
}

struct ColorSwatch_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatch(color: .red)
    }
}
