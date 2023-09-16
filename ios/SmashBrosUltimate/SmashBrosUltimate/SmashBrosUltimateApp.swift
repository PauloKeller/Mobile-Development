//
//  SmashBrosUltimateApp.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 17/01/22.
//

import SwiftUI
import RealmSwift

@main
struct SmashBrosUltimateApp: SwiftUI.App {
  let realm = try! Realm()
  
  var body: some Scene {
    WindowGroup {
      if SharedPreferencesManager.shared.getIsNotFirstTime() {
        AllGamesView(realm: realm)
      } else {
        OnboardingView(realm: realm)
      }
    }
  }
}
