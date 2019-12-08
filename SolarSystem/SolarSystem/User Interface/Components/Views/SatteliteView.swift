//
//  SatteliteView.swift
//  SolarSystem
//
//  Created by Katalin Neda on 08/12/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

class SatteliteView: UIView, NibRepresentable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        setupView()
    }
    
    private func setupView() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }

}
