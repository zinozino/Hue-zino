//
//  JHSideMenu.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 30..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit
class Interactor: UIPercentDrivenInteractiveTransition {
    var hasStarted = false
    var shouldFinish = false
}
protocol Containerable {
    var viewTag: Int {get}
    var fromeWidth: CGFloat {get}
    var toWidth: CGFloat {get set}
    var isRotation: Bool {get}
    var isFinished: Bool {get}
}

extension Containerable {

    var viewTag: Int {

        return 1
    }

}

class JHSideMenuTransitioning: NSObject, UIViewControllerAnimatedTransitioning, Containerable {
    var isRotation: Bool {

        if UIDevice.current.orientation.isLandscape {
          return true
        } else {
            return false
        }
    }

    var isFinished: Bool {
        return false
    }

    init(ratio: CGFloat) {

        self.toWidth = ratio
    }

    var fromeWidth: CGFloat {

        return 1.0 - toWidth

    }

    var toWidth: CGFloat

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {

                print("Could Getting transitionContext")
                return

        }

        let rect = UIScreen.main.bounds

        let container = transitionContext.containerView

        container.insertSubview(toViewController.view, belowSubview: fromViewController.view)

        let snapshot = fromViewController.view.snapshotView(afterScreenUpdates: false)
        snapshot?.tag = viewTag
        snapshot?.isUserInteractionEnabled = false
        snapshot?.layer.opacity = 1
        container.insertSubview(snapshot!, aboveSubview: toViewController.view)
        fromViewController.view.isHidden = true
        fromViewController.view.isHidden = true
        UIView.animate(withDuration: 0.3, animations: { [weak self] in

                 snapshot?.center.x += rect.width * (self?.toWidth)!

        }) {   (_) in
            fromViewController.view.isHidden = false
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {

         return 0.3
    }

}
