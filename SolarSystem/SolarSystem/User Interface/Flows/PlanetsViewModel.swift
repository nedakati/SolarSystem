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
    func didTapSattelitesView()
}

final class PlanetsViewModelImpl: PlanetsViewModel {
    
    weak var flowDelegate: PlanetsFlowDelegate?
    
    func didTapSattelitesView() {
        flowDelegate?.didTapSattelitesView()
    }
}
