//
//  AppDelegate.swift
//  EnvSchemes
//
//  Created by paulo on 20/07/20.
//  Copyright © 2020 paulo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private func setupFirebaseConfigFiles(filename: String) {
        // Load a named file
        let filePath = Bundle.main.path(forResource: filename, ofType: "plist")
        guard let fileopts = FirebaseOptions(contentsOfFile: filePath!) else {
            print("Fail to load firebase file")
            return
        }
        
        FirebaseApp.configure(options: fileopts)
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        #if LOCAL || DEV || QA
        //GoogleService-Info-dev
        setupFirebaseConfigFiles(filename: "setupFirebaseConfigFiles")
        #elseif PROD
        //GoogleService-Info
        setupFirebaseConfigFiles(filename: "GoogleService-Info")
        #endif
        
        #if LOCAL
        print("LOCAL")
        
        #elseif DEV
        print("DEV")
        
        #elseif QA
        print("QA")
        
        #else
        print("PROD")
        
        #endif
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

