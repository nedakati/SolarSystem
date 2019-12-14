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
    @IBOutlet weak var footerView: FooterView!
    
    private let cellWidth: CGFloat = 250
    private var selectedCellIndexPath: IndexPath = IndexPath(row: 0, section: 0)
    private var didLoad = false
    
    private let animator = Animator()
    
    // MARK: - Private properties
    
    private var viewModel: PlanetsViewModel!
    
    // MARK: - Lifecycle
    
    static func make(with viewModel: PlanetsViewModel) -> PlanetsViewController? {
        guard let viewController = UIStoryboard(name: "PlanetsViewController", bundle: nil).instantiateInitialViewController() as? PlanetsViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.scrollToItem(at: self.selectedCellIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        footerView.isHidden = false
        collectionView.isHidden = false
//        self.collectionView.scrollToItem(at: self.selectedCellIndexPath, at: .centeredHorizontally, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        selectedCellIndexPath = IndexPath(row: viewModel.planetCellViewModels.count / 2, section: 0)
    }
    
    private func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: true)

        collectionView.register(cellType: PlanetCollectionViewCell.self)
        collectionView.alpha = 0
        collectionView.delegate = self
        collectionView.dataSource = self
        
        footerView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension PlanetsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.planetCellViewModels.count }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PlanetCollectionViewCell.self)
        cell.viewModel = viewModel.planetCellViewModels[indexPath.row]

        return cell
    }
}

// MARK: - UICollectionViewDelegate

// Note: UICollectionViewDelegate inherits from UIScrollViewDelegate.
extension PlanetsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? PlanetCollectionViewCell else { return }
        UIView.animate(withDuration: 0.5) {
            selectedCell.changeAlpha(1)
            selectedCell.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
        selectedCellIndexPath = indexPath
        
        for ind in 0..<collectionView.numberOfItems(inSection: 0) {
            let cell = collectionView.cellForItem(at: IndexPath(row: ind, section: 0)) as? PlanetCollectionViewCell
            if cell != selectedCell {
                UIView.animate(withDuration: 0.5) {
                    cell?.changeAlpha(0.7)
                    cell?.transform = .identity
                }
            }
        }
    }

    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) {
            self.collectionView.alpha = 1
            guard let cell = self.collectionView.cellForItem(at: self.selectedCellIndexPath) as? PlanetCollectionViewCell else { return }
            UIView.animate(withDuration: 0.5) {
                cell.changeAlpha(1)
                cell.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlanetsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        
            return CGSize(width: cellWidth, height: collectionView.bounds.size.height)
    }
}

// MARK: - FooterViewDelegate

extension PlanetsViewController: FooterViewDelegate {
    
    func didTapSatelitesView(on view: FooterView) {
        footerView.isHidden = true
//        UIView.animate(withDuration: 0.2, animations: {
//            guard let selectedCell = self.collectionView.cellForItem(at: self.selectedCellIndexPath) as? PlanetCollectionViewCell else { return }
//            selectedCell.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
//        }) { _ in
            self.viewModel.didTapSattelitesView(at: self.selectedCellIndexPath.row)
//        }
        
    }
}

extension PlanetsViewController: UIViewControllerTransitioningDelegate {
    
    // return a custom transition
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard let selectedCell = collectionView.cellForItem(at: selectedCellIndexPath) as? PlanetCollectionViewCell, let selectedCellSuperview = selectedCell.superview else { return nil }
        
        animator.originFrameOfPlanet = selectedCellSuperview.convert(selectedCell.frame, to: nil)
//        animator.originFrameOfPlanet = CGRect(
//          x: animator.originFrameOfPlanet.origin.x + 20,
//          y: animator.originFrameOfPlanet.origin.y + 20,
//          width: animator.originFrameOfPlanet.size.width - 40,
//          height: animator.originFrameOfPlanet.size.height - 40
//        )
        
        animator.isPresenting = true
        collectionView.isHidden = true
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      return nil
    }
}
