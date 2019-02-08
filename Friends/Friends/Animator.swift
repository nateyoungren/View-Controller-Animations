//
//  Animator.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var push = false
    var fromLabel: UILabel?
    var fromImageView: UIImageView?
    var toLabel: UILabel?
    var toImageView: UIImageView?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromLabel = fromLabel,
        let fromImageView = fromImageView,
        let toView = transitionContext.view(forKey: .to),
        let toVC = transitionContext.viewController(forKey: .to)
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        if push {
            guard let detailVC = transitionContext.viewController(forKey: .to) as? DetailViewController else { transitionContext.completeTransition(false)
                return }
            toLabel = detailVC.label
            toImageView = detailVC.image
        }

        let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)

        containerView.addSubview(toView)

        toView.frame = toViewEndFrame
        toView.alpha = 0

        fromLabel.alpha = 0
        fromImageView.alpha = 0
        toLabel?.alpha = 0
        toImageView?.alpha = 0

        let transitionLabelInitialFrame = containerView.convert(fromLabel.bounds, to: fromLabel)
        let transitionImageInitialFrame = containerView.convert(fromImageView.bounds, to: fromImageView)

        let transitionLabel = UILabel(frame: transitionLabelInitialFrame)
        let transitionImage = UIImageView(frame: transitionImageInitialFrame)

        transitionLabel.font = fromLabel.font
        transitionLabel.text = fromLabel.text

        transitionImage.image = fromImageView.image

        containerView.addSubview(transitionLabel)
        containerView.addSubview(transitionImage)

        let transitionDuration = self.transitionDuration(using: transitionContext)

        toView.layoutIfNeeded()

        UIView.animate(withDuration: transitionDuration, animations: {

            let transitionLabelEndFrame = containerView.convert(self.toLabel!.bounds, to: self.toLabel!)
            let transitionImageEndFrame = containerView.convert(self.toImageView!.bounds, to: self.toImageView!)
            transitionLabel.frame = transitionLabelEndFrame
            transitionImage.frame = transitionImageEndFrame

            toView.alpha = 1

        }) { (_) in

            self.toLabel?.alpha = 1
            self.toImageView?.alpha = 1
            fromLabel.alpha = 1
            fromImageView.alpha = 1

            transitionLabel.removeFromSuperview()
            transitionImage.removeFromSuperview()

            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }
        
    }
    
}
