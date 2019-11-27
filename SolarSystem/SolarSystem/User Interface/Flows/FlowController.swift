//
//  FlowController.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 19/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

class FlowController {
    
    // MARK: - Private properties
    
    private var navigationController: UINavigationController!
    private let planetsViewController = PlanetsViewController.make(with: PlanetsViewModelImpl())
    
    // MARK: - Lifecycle
    
    func start() {
        navigationController = UINavigationController(rootViewController: planetsViewController!)
    }
    
    func rootViewController() -> UIViewController {
        return navigationController
    }
}
