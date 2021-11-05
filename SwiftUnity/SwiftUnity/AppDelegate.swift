//
//  AppDelegate.swift
//  SwiftUnity
//
//  Created by gaobo on 2021/11/3.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        Unity.shared.setHostMainWindow(window!)
        
        return true
    }

    

}

