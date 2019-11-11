//
//  Reusable.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import Foundation

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
