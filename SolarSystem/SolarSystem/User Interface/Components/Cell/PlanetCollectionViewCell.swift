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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
