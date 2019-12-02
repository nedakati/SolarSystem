//
//  PlanetsViewModel.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 11/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import Foundation

protocol PlanetsFlowDelegate: AnyObject {
    func didTapSattelitesView()
}

protocol PlanetsViewModel: class {
    var planetCellViewModels: [PlanetCollectionCellViewModel] { get }
    func didTapSattelitesView()
}

final class PlanetsViewModelImpl: PlanetsViewModel {
    
    var planetCellViewModels: [PlanetCollectionCellViewModel] = []
    weak var flowDelegate: PlanetsFlowDelegate?
    
    init() {
        for planet in Planet.allCases {
            planetCellViewModels.append(PlanetCollectionCellViewModelImpl(planet: planet))
        }
    }

    func didTapSattelitesView() {
        flowDelegate?.didTapSattelitesView()
    }
}
