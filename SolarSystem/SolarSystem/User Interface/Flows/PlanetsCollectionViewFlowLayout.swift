//
//  PlanetsCollectionViewFlowLayout.swift
//  SolarSystem
//
//  Created by Katalin Neda on 19/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

class PlanetsCollectionViewFlowLayout: UICollectionViewFlowLayout {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        scrollDirection = .horizontal
        minimumLineSpacing = 0
        sectionInsetReference = .fromLayoutMargins
        sectionInset = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 70)
    }
}
