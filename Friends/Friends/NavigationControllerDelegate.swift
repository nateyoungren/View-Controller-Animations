//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Nathanael Youngren on 2/7/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            
            if let toVC = toVC as? DetailViewController {
                self.animator.fromImageView = self.sourceCell?.imageView
                self.animator.fromLabel = self.sourceCell?.textLabel
                self.animator.toImageView = toVC.image
                self.animator.toLabel = toVC.label
                animator.push = true
            }
            return animator
        } else if operation == .pop {
            
            if let fromVC = fromVC as? DetailViewController {
                self.animator.fromImageView = fromVC.image
                self.animator.fromLabel = fromVC.label
                self.animator.toImageView = self.sourceCell?.imageView
                self.animator.toLabel = self.sourceCell?.textLabel
                animator.push = false
            }
            return animator
        } else {
            return nil
        }
    }
    
    var sourceCell: UITableViewCell?
    
    let animator = Animator()
    
}
