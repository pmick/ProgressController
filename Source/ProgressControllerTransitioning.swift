//
//  ProgressControllerTransitioning.swift
//  Next
//
//  Created by Patrick Mick on 12/19/15.
//  Copyright © 2015 Next. All rights reserved.
//

import Foundation
import UIKit

class ProgressPresentationController: UIPresentationController {
    lazy var overlayView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return v
    }()
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        self.overlayView.alpha = 0
        self.containerView!.addSubview(self.overlayView)
        self.containerView!.addSubview(self.presentedView()!)
        
        let coordinator = self.presentedViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ context in
            self.overlayView.alpha = 1
            }, completion: nil)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        
        self.overlayView.frame = self.presentingViewController.view.bounds
    }
    
    override func presentationTransitionDidEnd(completed: Bool) {
        super.presentationTransitionDidEnd(completed)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        let coordinator = self.presentedViewController.transitionCoordinator()
        coordinator?.animateAlongsideTransition({ context in
            self.overlayView.alpha = 0
            }, completion: nil)
    }
}

private extension UIView {
    class func animateDampenedSpringWithDuration(duration: NSTimeInterval, delay: NSTimeInterval = 0, options: UIViewAnimationOptions = [], @autoclosure(escaping) animation: () -> Void, completion: ((Bool) -> Void)? = nil) {
        UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: options, animations: animation, completion: completion)
    }
}

class ProgressAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = true
    private static let TransitionDuration = 0.2
    private static let HiddenTransform = CGAffineTransformMakeScale(0.001, 0.001)
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return ProgressAnimationController.TransitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            presentInContext(transitionContext)
        } else {
            dismissInContext(transitionContext)
        }
    }
    
    func presentInContext(transitionContext: UIViewControllerContextTransitioning) {
        guard let vc = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as? ProgressController else {
            fatalError("Trying to use a ProgressAnimationController with a view controller that is not ProgressController")
        }
        
        let a = vc.activityIndicator
        a.transform = ProgressAnimationController.HiddenTransform
        UIView.animateDampenedSpringWithDuration(ProgressAnimationController.TransitionDuration,
            animation: a.transform = CGAffineTransformIdentity) { finished in
                transitionContext.completeTransition(finished)
        }
    }
    
    func dismissInContext(transitionContext: UIViewControllerContextTransitioning) {
        guard let vc = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)! as? ProgressController else {
            fatalError("Trying to use a ProgressAnimationController with a view controller that is not ProgressController")
        }
        
        UIView.animateDampenedSpringWithDuration(ProgressAnimationController.TransitionDuration,
            animation: vc.activityIndicator.transform = ProgressAnimationController.HiddenTransform) { finished in
                transitionContext.completeTransition(finished)
        }
    }
}

class ProgressTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return ProgressPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ProgressAnimationController()
        animationController.isPresenting = true
        return animationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animationController = ProgressAnimationController()
        animationController.isPresenting = false
        return animationController
    }
}
