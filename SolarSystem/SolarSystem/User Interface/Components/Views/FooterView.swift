//
//  FooterView.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 11/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

protocol FooterViewDelegate: AnyObject {
    func didTapSatelitesView(on view: FooterView)
}

final class FooterView: UIView, NibRepresentable {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var axisRotationView: InfoView!
    @IBOutlet private weak var atmosphereView: InfoView!
    @IBOutlet private weak var satelitesView: InfoView!
    @IBOutlet private weak var moreDataButton: UIButton!
    
    // MARK: - Public properties
    
    weak var delegate: FooterViewDelegate?
    
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

        moreDataButton.decorate(with: [BorderDecorator(borderWidth: 1.0, borderColor: .white), CornerRadiusDecorator(radius: 10.0)])
        moreDataButton.setTitle("More Data", for: .normal)
        moreDataButton.setTitleColor(.lightGray, for: .normal)
        
        axisRotationView.title = "Complete axis rotation"
        axisRotationView.bottomDetailText = "hours"
        axisRotationView.numberText = "24"
        axisRotationView.topDetailText = ".6"

        atmosphereView.title = "Main gas in atmosphere"
        atmosphereView.topDetailText = "%"
        atmosphereView.bottomDetailText = "CO2"
        atmosphereView.numberText = "95"
        
        satelitesView.isUserInteractionEnabled = true
        satelitesView.title = "Number of sattelites"
        satelitesView.numberText = "2"
        satelitesView.topDetailText = ""
        satelitesView.bottomDetailText = ""
        satelitesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(satelitesViewTouched)))
    }
    
    // MARK: - Callbacks
    
    @objc private func satelitesViewTouched() {
        UIView.animate(withDuration: 0.33, animations: {
            self.satelitesView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            self.satelitesView.transform = .identity
            self.delegate?.didTapSatelitesView(on: self)
        })
    }
}
