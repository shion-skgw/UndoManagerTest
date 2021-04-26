//
//  AppDelegate.swift
//  UndoManagerTest
//
//  Created by Shion on 2021/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ViewController()
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}
