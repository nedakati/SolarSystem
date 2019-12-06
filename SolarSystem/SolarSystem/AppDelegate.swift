//
//  AppDelegate.swift
//  SolarSystem
//
//  Created by Katalin Neda on 06/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var flow: FlowController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let flow = FlowController()
        flow.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = flow.rootViewController()
        return true
    }
}

