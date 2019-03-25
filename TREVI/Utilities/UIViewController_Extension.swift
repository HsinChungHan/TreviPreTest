//
//  UIViewController_Extension.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/26.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
extension UIViewController{
    func setupRightNavigationItemByImage(img: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: img), style: .plain, target: self, action: selector)
    }
    func setupLeftNavigationItemByImage(img: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: img), style: .plain, target: self, action: selector)
    }
    func setupRightNavigationItemByTitle(title: String, selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
    func setupLeftNavigationItemByTitle(title: String, selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
    }
}
