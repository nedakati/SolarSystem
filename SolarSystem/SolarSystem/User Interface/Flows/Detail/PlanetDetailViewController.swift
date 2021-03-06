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
    @IBOutlet private weak var sattelitesStackView: UIStackView!
    @IBOutlet private weak var firstSatteliteView: SatteliteView!
    @IBOutlet private weak var secondSatteliteView: SatteliteView!
    @IBOutlet weak var planetImageView: UIImageView!

    private var viewModel: PlanetDetailViewModel!
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 1.2, animations: {
            self.planetImageView.transform = CGAffineTransform(scaleX: 2.5, y: 2.5).translatedBy(x: 0.0, y: 240.0)
        }) { _ in
            self.animateAppearance()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        planetImageView.image = viewModel.planet.image
        setupView()
    }
    
    static func make(viewModel: PlanetDetailViewModel) -> PlanetDetailViewController? {
        guard let viewController = UIStoryboard(name: "PlanetDetailViewController", bundle: nil).instantiateInitialViewController() as? PlanetDetailViewController else { return nil }
        viewController.viewModel = viewModel
        return viewController
    }
    
    private func setupView() {
        closeButton.alpha = 0
        titleLabel.alpha = 0
        rankView.alpha = 0
        sattelitesStackView.alpha = 0
        
        titleLabel.text = "Mars' sattelites"
        rankView.position = 6
        rankView.nextPlanet = "Earth"
        firstSatteliteView.title = "Deimos"
        secondSatteliteView.title = "Phobos"
    }
    
    private func animateAppearance() {
        let titleOffset = CGPoint(x: 0, y: -titleLabel.frame.maxY)
        let rankOffset = CGPoint(x: 0, y: -rankView.frame.maxY)
        titleLabel.transform = CGAffineTransform(translationX: titleOffset.x, y: titleOffset.y)
        closeButton.transform = CGAffineTransform(translationX: titleOffset.x, y: titleOffset.y)
        rankView.transform = CGAffineTransform(translationX: rankOffset.x, y: rankOffset.y)

        UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.titleLabel.transform = .identity
            self.closeButton.transform = .identity
            
            self.titleLabel.alpha = 1
            self.closeButton.alpha = 1
        }, completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.rankView.transform = .identity
                    self.rankView.alpha = 1
                }, completion: { completed in
                    if completed {
                        UIView.animate(withDuration: 0.33, delay: 0, options: .curveEaseIn, animations: {
                            self.sattelitesStackView.alpha = 1
                        })
                    }
                })
            }
        })
    }
    
    private func animateDissapearance() {
        let titleOffset = CGPoint(x: 0, y: -titleLabel.frame.maxY / 3)
        let rankOffset = CGPoint(x: 0, y: -rankView.frame.maxY / 3)
        let sattelitesOffset = CGPoint(x: 0, y: -sattelitesStackView.frame.maxY / 3)
        UIView.animate(withDuration: 0.20, delay: 0, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: titleOffset.x, y: titleOffset.y)
            self.closeButton.transform = CGAffineTransform(translationX: titleOffset.x, y: titleOffset.y)
            self.titleLabel.alpha = 0
            self.closeButton.alpha = 0
        }, completion: { completed in
            if completed {
                UIView.animate(withDuration: 0.20, delay: 0, options: .curveEaseOut, animations: {
                    self.rankView.transform = CGAffineTransform(translationX: rankOffset.x, y: rankOffset.y)
                    self.rankView.alpha = 0
                }, completion: { completed in
                    UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {
                        self.sattelitesStackView.transform = CGAffineTransform(translationX: sattelitesOffset.x, y: sattelitesOffset.y)
                        self.sattelitesStackView.alpha = 0
                    }, completion: { completed in
                        if completed {
                            UIView.animate(withDuration: 0.5, animations: {
                                self.planetImageView.transform = .identity
                            }, completion: { _ in
                                self.dismiss(animated: true, completion: nil)
                            })
                        }
                    })
                })
            }
        })
    }

    // MARK: - User Actions
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
        animateDissapearance()
    }
}
