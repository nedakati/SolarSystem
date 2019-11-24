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
    
    var viewModel: PlanetCollectionCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            planeTitleLabel.text = viewModel.title
            planetImageView.image = viewModel.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
