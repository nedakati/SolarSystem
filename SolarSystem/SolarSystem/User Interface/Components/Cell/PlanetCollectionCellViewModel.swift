//
//  PlanetCollectionCellViewModel.swift
//  SolarSystem
//
//  Created by Katalin Neda on 19/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

protocol PlanetCollectionCellViewModel {
    var title: String { get }
    var image: UIImage? { get }
}

class PlanetCollectionCellViewModelImpl: PlanetCollectionCellViewModel {
    
    var title: String
    var image: UIImage?
    
    init(planet: Planet) {
        title = planet.title
        image = planet.image
    }
}
