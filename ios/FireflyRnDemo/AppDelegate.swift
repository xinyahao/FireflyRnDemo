//
//  AppDelegate.swift
//  FireflyRnDemo
//
//  Created by xinya on 2022/12/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = MainTabBarController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

}


