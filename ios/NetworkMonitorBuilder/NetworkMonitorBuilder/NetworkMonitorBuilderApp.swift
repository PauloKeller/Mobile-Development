//
//  NetworkMonitorBuilderApp.swift
//  NetworkMonitorBuilder
//
//  Created by Paulo Vinicius Keller on 12/1/22.
//

import SwiftUI
import NetworkMonitor

@main
struct NetworkMonitorBuilderApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
