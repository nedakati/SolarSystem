//
//  PlanetCollectionViewCell.swift
//  SolarSystem
//
//  Created by Katalin Neda on 19/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell, NibReusable {
   
    // MARK: - Outlets
    
    @IBOutlet weak var planeTitleLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewWidthConstraint: NSLayoutConstraint!
    
    
    var viewModel: PlanetCollectionCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            planeTitleLabel.text = viewModel.title
            planetImageView.image = viewModel.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        planetImageView.alpha = 0.7
        imageViewWidthConstraint.constant = 200
        imageViewHeightConstraint.constant = 200
    }
    
    func changeAlpha(_ alpha: CGFloat) {
        planetImageView.alpha = alpha
        imageViewWidthConstraint.constant = alpha == 1 ? 250 : 200
        imageViewHeightConstraint.constant = alpha == 1 ? 250 : 200
    }
}
