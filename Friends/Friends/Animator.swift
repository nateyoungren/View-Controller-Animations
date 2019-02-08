//
//  Animator.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? FriendsTableViewController,
        let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.view(forKey: .to),
        let cell = NavigationControllerDelegate().sourceCell else {
            transitionContext.completeTransition(false)
            return
        }

        let containerView = transitionContext.containerView

        let toViewEndFrame = transitionContext.finalFrame(for: toVC)

        containerView.addSubview(toView)

        toView.frame = toViewEndFrame
        toView.alpha = 0

        let fromLabel = cell.textLabel!
        let fromImage = cell.imageView!

        let toLabel = toVC.label!
        let toImage = toVC.image!

        fromLabel.alpha = 0
        fromImage.alpha = 0
        toLabel.alpha = 0
        toImage.alpha = 0

        let transitionLabelInitialFrame = containerView.convert(fromLabel.bounds, to: fromLabel)
        let transitionImageInitialFrame = containerView.convert(fromImage.bounds, to: fromImage)

        let transitionLabel = UILabel(frame: transitionLabelInitialFrame)
        let transitionImage = UIImageView(frame: transitionImageInitialFrame)

        transitionLabel.font = fromLabel.font
        transitionLabel.text = fromLabel.text

        transitionImage.image = fromImage.image

        containerView.addSubview(transitionLabel)
        containerView.addSubview(transitionImage)

        let transitionDuration = self.transitionDuration(using: transitionContext)

        toView.layoutIfNeeded()

        UIView.animate(withDuration: transitionDuration, animations: {

            let transitionLabelEndFrame = containerView.convert(toLabel.bounds, to: toLabel)
            let transitionImageEndFrame = containerView.convert(toImage.bounds, to: toImage)
            transitionLabel.frame = transitionLabelEndFrame
            transitionImage.frame = transitionImageEndFrame

            toView.alpha = 1

        }) { (_) in

            toLabel.alpha = 1
            toImage.alpha = 1
            fromLabel.alpha = 1
            fromImage.alpha = 1

            transitionLabel.removeFromSuperview()
            transitionImage.removeFromSuperview()

            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }
        
    }
    
    
    
    
    
}
