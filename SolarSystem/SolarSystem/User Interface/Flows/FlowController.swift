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
    private var planetsViewController: PlanetsViewController?
    
    // MARK: - Lifecycle
    
    func start() {
        navigationController = UINavigationController(rootViewController: firstScreen() ?? UIViewController())
    }
    
    func rootViewController() -> UIViewController {
        return navigationController
    }
    
    private func firstScreen() -> UIViewController? {
        let planetsViewModel = PlanetsViewModelImpl()
        planetsViewModel.flowDelegate = self
        return PlanetsViewController.make(with: planetsViewModel)
    }
}

extension FlowController: PlanetsFlowDelegate {
    
    func didTapSattelitesView(on planet: Planet) {
        let viewModel = PlanetDetailViewModelImpl(planet: planet)
        guard let viewController = PlanetDetailViewController.make(viewModel: viewModel) else { return }
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
