//
//  CornerRadiusDecorator.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

struct CornerRadiusDecorator: ViewDecorator {
    private let radius: CGFloat?
    
    init(radius: CGFloat? = nil) {
        self.radius = radius
    }
    
    func decorate(view: UIView) {
        view.layer.cornerRadius = radius ?? min(view.frame.width, view.frame.height) / 2
        view.layer.masksToBounds = true
    }
}
