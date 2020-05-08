//
//  ContentView.swift
//  WeatherApp
//
//  Created by Paulo Keller on 07/05/20.
//  Copyright © 2020 Paulo Keller. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter city", text: $input).font(.title)
            Divider()
            Text(input).font(.body)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
