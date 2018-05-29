//
//  SearchViewController.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 29..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate {

    var searchController: CustomSearchController!
    override func viewDidLoad() {
        super.viewDidLoad()

            initNavibar()

    }

    func initNavibar() {

        self.navigationController?.navigationBar.barTintColor = UIColor.blue

        let left = UIBarButtonItem(image: #imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchupInsideSearch))
        self.navigationItem.title = "LIVE"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationItem.rightBarButtonItem = left

    }

  @objc  private func touchupInsideSearch() {

//    searchController = CustomSearchController.init(searchResultsController: nil)
//      searchController.searchBar.layer.removeAllAnimations()
//    searchController.searchResultsUpdater = self
//    searchController.delegate = self
//    searchController.searchBar.delegate = self
//    searchController.hidesNavigationBarDuringPresentation = false
//    searchController.dimsBackgroundDuringPresentation = false
//    searchController.searchBar.sizeToFit()
//    navigationItem.titleView = searchController.searchBar

    let searchbar = UISearchBar()
    searchbar.showsCancelButton = false
    searchbar.placeholder = "아프리카TV검색"
  let tf =  searchbar.value(forKey: "searchField") as! UITextField
    tf.backgroundColor = UIColor.black
    self.navigationItem.titleView = searchbar

    }

    func updateSearchResults(for searchController: UISearchController) {

    }

    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
