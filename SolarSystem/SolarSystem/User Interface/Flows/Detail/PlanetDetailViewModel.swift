//
//  PlanetDetailViewModel.swift
//  SolarSystem
//
//  Created by Katalin Neda on 07/12/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import Foundation

protocol PlanetDetailViewModel {
    var title: String { get }
}

class PlanetDetailViewModelImpl: PlanetDetailViewModel {
    
    var title: String
    
    private let planet: Planet
    
    init(planet: Planet) {
        self.planet = planet
        self.title = planet.title
    }
}
