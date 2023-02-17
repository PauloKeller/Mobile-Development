//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Paulo Vinicius Keller on 28/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var red = 1.0
    @State var blue = 1.0
    @State var green = 0.5
    
    var body: some View {
        NavigationView {
            List(DataModel.data, id: \.self) { object in
                HStack {
                    Image(systemName: object.icon)
                        .foregroundColor(object.color)
                    Text("\(object.high)º F")
                        .foregroundColor(Color.blue)
                    Text(object.day)
                    NavigationLink(object.day, destination: DetailView(data: object))
                }
            }
            .navigationTitle("New York City")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
