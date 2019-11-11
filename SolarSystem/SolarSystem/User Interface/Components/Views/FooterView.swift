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

final class FooterView: UICollectionReusableView, NibRepresentable {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var axisRotationView: InfoView!
    @IBOutlet private weak var atmosphereView: InfoView!
    @IBOutlet private weak var satelitesView: InfoView!
    @IBOutlet private weak var moreDataButton: UIButton!
    
    // MARK: - Public properties
    
    weak var delegate: FooterViewDelegate?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    private func setupView() {
        moreDataButton.decorate(with: [BorderDecorator(borderWidth: 2.0, borderColor: .white), CornerRadiusDecorator(radius: 10.0)])
        moreDataButton.setTitle("More Data", for: .normal)
        
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
        satelitesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(satelitesViewTouched)))
    }
    
    // MARK: - Callbacks
    
    @objc private func satelitesViewTouched() {
        delegate?.didTapSatelitesView(on: self)
    }
}
