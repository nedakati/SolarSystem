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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var rankinNumberLabel: UILabel!
    @IBOutlet weak var rankingNumberLabel: UILabel!
    @IBOutlet weak var thLabel: UILabel!
    @IBOutlet weak var followedByLabel: UILabel!
    @IBOutlet weak var followedByPlanetLabel: UILabel!
    
    @IBOutlet weak var planetImageVire: UIImageView!
    @IBOutlet weak var planetViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var planetView: UIView!
    
    private var viewModel: PlanetDetailViewModel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1.2) {
            self.planetImageVire.transform = CGAffineTransform(scaleX: 2.5, y: 2.5).translatedBy(x: 0.0, y: 250.0)
        }
    }
    
    static func make(viewModel: PlanetDetailViewModel) -> PlanetDetailViewController? {
        guard let viewController = UIStoryboard(name: "PlanetDetailViewController", bundle: nil).instantiateInitialViewController() as? PlanetDetailViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func configureUI() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "CaviarDreams", size: 20)!]
        titleLabel.text = "\(viewModel.title)'s sattelites"
        rankinNumberLabel.text = "Rank in number sattelites"
        rankingNumberLabel.text = "6"
        thLabel.text = "th"
        followedByLabel.text = "Followed by"
        followedByPlanetLabel.text = "Earth"
    }
    
    // MARK: - User Actions
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
