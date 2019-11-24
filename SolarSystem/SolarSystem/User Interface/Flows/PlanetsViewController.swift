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
    
    private let cellWidth: CGFloat = 250

    // MARK: - Private properties
    
    private var viewModel: PlanetsViewModel!
    
    // MARK: - Lifecycle
    
    static func make(with viewModel: PlanetsViewModel) -> PlanetsViewController? {
        guard let viewController = UIStoryboard(name: "PlanetsViewController", bundle: nil).instantiateInitialViewController() as? PlanetsViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.scrollToItem(at: IndexPath(row: viewModel.planetCellViewModels.count / 2, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        collectionView.register(cellType: PlanetCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource

extension PlanetsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { viewModel.planetCellViewModels.count }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PlanetCollectionViewCell.self)
        cell.viewModel = viewModel.planetCellViewModels[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlanetsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            CGSize(width: cellWidth, height: collectionView.bounds.size.height)
    }
}

// MARK: - FooterViewDelegate

extension PlanetsViewController: FooterViewDelegate {
    
    func didTapSatelitesView(on view: FooterView) {
        
    }
}
