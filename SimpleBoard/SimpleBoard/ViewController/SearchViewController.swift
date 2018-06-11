//
//  SearchViewController.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 29..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate {
    let interactor = Interactor()
    var menuTrasitioning: JHSideMenuTransitioning = JHSideMenuTransitioning(ratio: 0.6)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }

    override func viewDidLoad() {
        super.viewDidLoad()

            initNavibar()

    }

    func initNavibar() {

        self.navigationController?.navigationBar.barTintColor = UIColor.blue

        let rightSearch = UIBarButtonItem(image: #imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchupInsideSearch))
        self.navigationItem.title = "LIVE"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        let rightStar = UIBarButtonItem(image: #imageLiteral(resourceName: "star").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)

        let leftMenu = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchupInsideMenu))
        self.navigationItem.leftBarButtonItems = [leftMenu]
        self.navigationItem.rightBarButtonItems = [rightSearch, rightStar]

    }

    @objc  private func touchupInsideSearch(sender: UIBarButtonItem) {
        self.navigationItem.setRightBarButtonItems([], animated: true)
        let searchbar = UISearchBar()
        searchbar.showsCancelButton = false
        searchbar.placeholder = "아프리카TV검색"
        searchbar.delegate = self
        let tf =  searchbar.value(forKey: "searchField") as! UITextField
        tf.backgroundColor = UIColor.black
        self.navigationItem.titleView = searchbar

        let leftBack = UIBarButtonItem(image: #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchupInsideBack))

        self.navigationItem.leftBarButtonItem = leftBack

    }

    @objc private func touchupInsideMenu() {

        let menu = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController2") as! MenuViewController

            menu.transitioningDelegate = self
            menu.vc = self
            self.present(menu, animated: true, completion: nil)

        print("위치: \(self.view.bounds)")
  }

    @objc private func touchupInsideBack(sender: UIBarButtonItem) {

        self.navigationItem.titleView = nil
        self.navigationItem.leftBarButtonItem = nil
        self.initNavibar()
    }

    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {

        print(searchText)
    }
}

extension SearchViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return menuTrasitioning
    }
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
