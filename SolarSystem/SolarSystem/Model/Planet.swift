//
//  Planet.swift
//  SolarSystem
//
//  Created by Katalin Neda on 19/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

enum Planet: CaseIterable {
    case sun
    case mercury
    case venus
    case moon
    case mars
    case jupiter
    case saturn
    case neptun
    case pluto
}

extension Planet {
    
    var image: UIImage? {
        switch self {
        case .sun: return UIImage(named: "Sun")
        case .mercury: return UIImage(named: "Mercury")
        case .venus: return UIImage(named: "Venus")
        case .moon: return UIImage(named: "Moon")
        case .mars: return UIImage(named: "Mars")
        case .jupiter: return UIImage(named: "Jupiter")
        case .saturn: return UIImage(named: "Saturn")
        case .neptun: return UIImage(named: "Neptune")
        case .pluto: return UIImage(named: "Pluto")
        }
    }
    
    var title: String {
        switch self {
        case .sun: return "Sun"
        case .mercury: return "Mercury"
        case .venus: return "Venus"
        case .moon: return "Moon"
        case .mars: return "Mars"
        case .jupiter: return "Jupiter"
        case .saturn: return "Saturn"
        case .neptun: return "Neptune"
        case .pluto: return "Pluto"
        }
    }
}
