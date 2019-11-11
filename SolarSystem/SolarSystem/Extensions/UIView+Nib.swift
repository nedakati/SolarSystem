//
//  UIView+Nib.swift
//  SolarSystem
//
//  Created by Alexandra Muresan on 08/11/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

protocol NibRepresentable {
    static var nib: UINib { get }
}

extension NibRepresentable where Self: UIView {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
    
    static func instantiate<T: UIView>(withOwner ownerOrNil: Any? = nil, options optionsOrNil: [UINib.OptionsKey: Any]? = nil) -> T {
        guard let view = nib.instantiate(withOwner: ownerOrNil, options: optionsOrNil).first as? T else {
            fatalError("The nib \(nib) expected its type to be \(self).")
        }
        return view
    }
}

/// A protocol used to register / dequeue reusable Nib represented views in code.
///
/// This is needed as a separate protocol in order to use Nib represented views in classes that are also reusable.
protocol NibReusable: NibRepresentable { }

extension UIView {
    
    /// Load Nib for a specific view
    public func loadNib() {
        let nibName = String(describing: type(of: self))
        
        guard let view = Bundle(for: type(of: self)).loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else { return
            assertionFailure("Failed to load Xib for \(String(describing: self))")
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}

