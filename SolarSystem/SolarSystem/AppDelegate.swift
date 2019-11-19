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
    
    var viewController: PlanetsViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        viewController = PlanetsViewController.make(with: PlanetsViewModelImpl())
        window?.rootViewController = viewController
        return true
    }
}

