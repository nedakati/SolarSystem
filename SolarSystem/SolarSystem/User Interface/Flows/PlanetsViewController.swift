//
//  PlanetsViewController.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 11/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

final class PlanetsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Private properties
    
    private var viewModel: PlanetsViewModel!
    
    // MARK: - Lifecycle
    
    static func make(with viewModel: PlanetsViewModel) -> PlanetsViewController? {
        guard let viewController = UIStoryboard(name: "PlanetsViewController", bundle: nil).instantiateInitialViewController() as? PlanetsViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension PlanetsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - FooterViewDelegate

extension PlanetsViewController: FooterViewDelegate {
    
    func didTapSatelitesView(on view: FooterView) {
        
    }
}
