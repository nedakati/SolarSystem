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
    private var indexOfCellBeforeDragging = 0
    
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
        let centerIndexPath = IndexPath(row: viewModel.planetCellViewModels.count / 2, section: 0)
        collectionView.scrollToItem(at: centerIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        indexOfCellBeforeDragging = viewModel.planetCellViewModels.count / 2
    }
    
    private func setupView() {
        collectionView.register(cellType: PlanetCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func indexOfMajorCell() -> Int {
        let proportionalOffset = (collectionView.collectionViewLayout.collectionView?.contentOffset.x ?? 0) / cellWidth
        let index = Int(round(proportionalOffset))
        return max(0, min(viewModel.planetCellViewModels.count - 1, index))
    }
}

// MARK: - UICollectionViewDataSource

extension PlanetsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { viewModel.planetCellViewModels.count }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PlanetCollectionViewCell.self)
        cell.viewModel = viewModel.planetCellViewModels[indexPath.row]
        let centerIndexPath = IndexPath(row: viewModel.planetCellViewModels.count / 2, section: 0)

        if indexPath == centerIndexPath {
            cell.changeAlpha(1)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

// Note: UICollectionViewDelegate inherits from UIScrollViewDelegate.
extension PlanetsViewController: UICollectionViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        indexOfCellBeforeDragging = indexOfMajorCell()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        
        let majorCellBeforeDragging = indexOfMajorCell() == indexOfCellBeforeDragging
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < viewModel.planetCellViewModels.count && velocity.x > 0.5
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging >= 1 && velocity.x < -0.5
        
        let didUseSwipeToSkipCell = majorCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)
       
        let index = indexOfMajorCell()
        
        if didUseSwipeToSkipCell {
            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            let toValue = cellWidth * CGFloat(snapToIndex)
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: velocity.x, options: .allowUserInteraction, animations: {
                scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                scrollView.layoutIfNeeded()
            }, completion: nil)
        } else {
            let indexPath = IndexPath(row: index, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
        let selectedCell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? PlanetCollectionViewCell
        selectedCell?.changeAlpha(1)
        
        for ind in 0..<collectionView.numberOfItems(inSection: 0) {
            let cell = collectionView.cellForItem(at: IndexPath(row: ind, section: 0)) as? PlanetCollectionViewCell
            if cell != selectedCell {
                cell?.changeAlpha(0.5)
            }
        }
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
