//
//  RankView.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 13/12/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

final class RankView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var positionLabel: UILabel!
    @IBOutlet private weak var followedByPlanet: UILabel!
    
    // MARK: - Public properties
    
    var position: Int? {
        didSet {
            guard let position = position else { return }
            positionLabel.text = String(position)
        }
    }
    
    var nextPlanet: String? {
        didSet {
            guard let planet = nextPlanet else { return }
            followedByPlanet.text = String(planet)
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
}
