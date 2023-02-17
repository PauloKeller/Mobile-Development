//
//  ContentView.swift
//  DynamicList
//
//  Created by paulo on 08/07/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var  id:Int
    
    let username: String
    let message: String
    let imageName: String
}

struct ContentView: View {
    let users: [User] = [
        .init(id: 0, username: "Tim Cook", message: "My nice shiny new monitor stand is $999", imageName: "images"),
        .init(id: 1, username: "Craig Federighi", message: "My nice shiny new monitor stand is $999", imageName: "images-11"),
        .init(id: 2, username: "Jon Ivey", message: "My nice shiny new monitor stand is $999 aihwdhawiuhdiuahwdiuahwiudhaiuwhdiuhaiuwdhiuahwiudhaiuhwdiuahwiudhiuawhiuhdiuahiuwhdiuh", imageName: "images-12"),
    ]
    
    var body: some View {
        NavigationView{
            List {
                Text("Users").font(.largeTitle)
                ForEach(users, id: \.id) { user in
                    UserRow(user: user)
                }
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct UserRow: View {
    let user: User
    
    var body: some View {
        HStack {
            Image(user.imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 4))
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(user.username).font(.headline)
                Text(user.message).font(.subheadline).lineLimit(nil)
            }.padding(.leading, 8)
        }.padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
