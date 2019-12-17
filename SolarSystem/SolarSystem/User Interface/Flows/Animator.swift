//
//  Animator.swift
//  SolarSystem
//
//  Created by Katalin Neda on 14/12/2019.
//  Copyright © 2019 Katalin Neda. All rights reserved.
//

import UIKit

// this will drive the animated view controller transitions

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    let duration = 5.0
    
    /**
     Tell the animator whether it is presenting or dismissing a view controller.
     */
    var isPresenting = true
    
    /**
     Store the original frame of the image.
     */
    var originFrameOfPlanet = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval { duration }
    
    /**
     transitionContext:  gives access to the parameters and view controllersof the transition.
     */
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // containerView: where the animation takes place
        let containerView = transitionContext.containerView
        
        // toView: the new view to present
        let toView = transitionContext.view(forKey: .to)!

        /**
        - when presenting, it will grow to take up the entire screen
        - when dismissed, it will shrink to the image’s original frame.
        */
        let planetView = isPresenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = isPresenting ? originFrameOfPlanet : planetView.frame
        let finalFrame = isPresenting ? planetView.frame : originFrameOfPlanet

        // grow/shrink the view
        let xScaleFactor = isPresenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = isPresenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if isPresenting {
          planetView.transform = scaleTransform
          planetView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
          planetView.clipsToBounds = true
        }

        planetView.layer.cornerRadius = isPresenting ? 20.0 : 0.0
        planetView.layer.masksToBounds = true

        containerView.addSubview(toView)
        containerView.bringSubviewToFront(planetView)

        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: {
            planetView.transform = self.isPresenting ? .identity : scaleTransform
            planetView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            planetView.layer.cornerRadius = !self.isPresenting ? 20.0 : 0.0
          }, completion: { _ in
            // transition animations are done and that UIKit is free to wrap up the view controller transition:
            transitionContext.completeTransition(true)
        })
        
    }
}
