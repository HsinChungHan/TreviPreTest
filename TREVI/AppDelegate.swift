//
//  AppDelegate.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/21.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = InputVC()
        return true
    }
}
