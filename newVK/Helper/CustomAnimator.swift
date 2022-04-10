//
//  CustomAnimator.swift
//  newVK
//
//  Created by Николай Онучин on 10.04.2022.
//

import UIKit

// MARK: PushAnimator
class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        
        let translation = CGAffineTransform(translationX: source.view.bounds.width-source.view.bounds.height,
                                    y: source.view.bounds.height)
        let scale = CGAffineTransform(rotationAngle: -90)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: {
                let translation = CGAffineTransform(translationX: -source.view.bounds.width+source.view.bounds.height,
                                                    y: source.view.bounds.height)
                let scale = CGAffineTransform(rotationAngle: 90)
                source.view.transform = translation.concatenating(scale)
            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: {
                let translation = CGAffineTransform(translationX: 0, y: 0)
                let scale = CGAffineTransform(rotationAngle: 0)
                destination.view.transform = translation.concatenating(scale)
            })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}

// MARK: PopAnimator
class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private let animationDuration: TimeInterval = 1
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(destination.view)
        transitionContext.containerView.sendSubviewToBack(destination.view)
        
        source.view.frame = transitionContext.containerView.frame
        destination.view.frame = transitionContext.containerView.frame
        
        let translation = CGAffineTransform(translationX: -source.view.bounds.width+source.view.bounds.height,
                                            y: source.view.bounds.height)
        let scale = CGAffineTransform(rotationAngle: 90)
        destination.view.transform = translation.concatenating(scale)
        
        UIView.animateKeyframes(withDuration: animationDuration, delay: 0, options: .calculationModePaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: {
                destination.view.transform = .identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0, animations: {
                let translation = CGAffineTransform(translationX: source.view.bounds.width-source.view.bounds.height,
                                            y: source.view.bounds.height)
                let scale = CGAffineTransform(rotationAngle: -90)
                source.view.transform = translation.concatenating(scale)
            })

        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.removeFromParent()
            } else if transitionContext.transitionWasCancelled {
                destination.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
    }
}
