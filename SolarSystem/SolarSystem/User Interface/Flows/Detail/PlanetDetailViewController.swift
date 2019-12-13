//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Katalin Neda on 07/12/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    @IBOutlet private weak var rankView: RankView!

    private var viewModel: PlanetDetailViewModel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func make(viewModel: PlanetDetailViewModel) -> PlanetDetailViewController? {
        guard let viewController = UIStoryboard(name: "PlanetDetailViewController", bundle: nil).instantiateInitialViewController() as? PlanetDetailViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func setupView() {
        rankView.position = 6
        rankView.nextPlanet = "Earth"
    }

    // MARK: - User Actions
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
