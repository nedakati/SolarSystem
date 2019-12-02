//
//  InfoView.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

final class InfoView: UIView, NibRepresentable {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var topDetailLabel: UILabel!
    @IBOutlet private weak var bottomDetailLabel: UILabel!
    
    // MARK: - Public properties
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var numberText: String? {
        didSet {
            numberLabel.text = numberText
        }
    }
    
    var topDetailText: String? {
        didSet {
            topDetailLabel.text = topDetailText ?? ""
        }
    }
    
    var bottomDetailText: String? {
        didSet {
            bottomDetailLabel.text = bottomDetailText ?? ""
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        loadNib()
        self.decorate(with: [CornerRadiusDecorator(radius: 10.0), BorderDecorator(borderWidth: 1.0, borderColor: .white)])
    }
}
