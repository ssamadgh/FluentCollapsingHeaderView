//
//  AppDelegate.swift
//  Weather
//
//  Created by Seyed Samad Gholamzadeh on 9/13/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = MainModule().build()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

