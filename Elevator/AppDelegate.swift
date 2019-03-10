//
//  AppDelegate.swift
//  Elevator
//
//  Created by Thanapat Sorralump on 10/3/2562 BE.
//  Copyright © 2562 Thanapat Sorralump. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appDelegateHelper: AppDelegateHelper?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appDelegateHelper = AppDelegateHelperImplementation(
            mainWindow: window,
            rootRouter: RootRouterImplementation(mainWindow: window)
        )
        
        appDelegateHelper?.rootToMainScreen()
        
        window?.makeKeyAndVisible()
        return true
    }
}

