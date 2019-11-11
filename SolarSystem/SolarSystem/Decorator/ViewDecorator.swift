//
//  ViewDecorator.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

protocol ViewDecorator {
    func decorate(view: UIView)
}

extension UIView {
    
    func decorate(with decorator: ViewDecorator) {
        decorator.decorate(view: self)
    }
    
    func decorate(with decorators: [ViewDecorator]) {
        decorators.forEach {
            $0.decorate(view: self)
        }
    }
}
