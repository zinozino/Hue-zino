//
//  MenuViewController.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 31..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var vc: UIViewController?
    var currentTrasitioning: JHSideMenuTransitioning?
    var closeButton: UIButton = UIButton()

    func initMenuView() {

     //   self.view.frame = UIScreen.main.bounds

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initMenuView()
         NotificationCenter.default.addObserver(self, selector: #selector(deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func deviceRotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {

             print("landScape")
        }
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            print("Portrait")
        }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.frame = UIScreen.main.bounds

        self.vc?.view.frame = UIScreen.main.bounds

    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

       super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(alongsideTransition: { [weak self](context) in

            let snapshot = context.containerView.viewWithTag(1)
            snapshot?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        }, completion: nil)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

}
