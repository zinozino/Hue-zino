//
//  Color_extension.swift
//  SimpleBoard
//
//  Created by jeongjinho on 2018. 5. 29..
//  Copyright © 2018년 jeongjinho. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1

        var rgbValue: UInt64 = 0

        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
class CustomSearchBar: UISearchBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        setShowsCancelButton(false, animated: false)
    }
}
class CustomSearchController: UISearchController, UISearchBarDelegate {

    lazy var _searchBar: CustomSearchBar = {
        [unowned self] in
        let result = CustomSearchBar(frame: .zero)
        result.delegate = self

        return result
        }()

    override var searchBar: UISearchBar {
        get {
            return _searchBar
        }
    }
}

extension UIViewController {

    static func loadFromNib<T: UIViewController>() -> T {

        return T(nibName: String(describing: self), bundle: nil)
    }

}
