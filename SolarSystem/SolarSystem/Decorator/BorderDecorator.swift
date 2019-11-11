//
//  BorderDecorator.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

struct BorderDecorator: ViewDecorator {
    private let borderWidth: CGFloat
    private let borderColor: UIColor?
    
    init(borderWidth: CGFloat = 1.0, borderColor: UIColor? = .white) {
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
    
    func decorate(view: UIView) {
        view.layer.borderWidth = borderWidth
        view.layer.borderColor = borderColor?.cgColor
    }
}
