//
//  AppDelegate.swift
//  HomeWorkLesson4
//
//  Created by m.kushakov on 11.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let mainScreenViewController = MainScreenViewController()
        let mainScreenNavigationController = UINavigationController(rootViewController: mainScreenViewController)
        
        window?.rootViewController = mainScreenNavigationController
        window?.makeKeyAndVisible()
        return true
    }
}

