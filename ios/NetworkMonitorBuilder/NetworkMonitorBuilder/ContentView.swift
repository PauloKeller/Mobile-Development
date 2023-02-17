//
//  ContentView.swift
//  NetworkMonitorBuilder
//
//  Created by Paulo Vinicius Keller on 12/1/22.
//

import SwiftUI
import NetworkMonitor

struct ConnectedView: View {
    var body: some View {
        VStack {
            Text("Connected")
        }
    }
}

struct DisconnectedView: View {
    var body: some View {
        VStack {
            Text("Disconnected")
        }
    }
}

struct ContentView: View {
    @EnvironmentObject private var networkMonitor: NetworkMonitor
    
    var body: some View {
        if networkMonitor.isConnected {
            ConnectedView()
        } else {
            DisconnectedView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
