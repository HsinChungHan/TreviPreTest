//
//  UIColor_Extension.swift
//  TREVI
//
//  Created by Chung Han Hsin on 2019/3/25.
//  Copyright © 2019 Chung Han Hsin. All rights reserved.
//

import UIKit
extension UIColor{
    static func setRandomColor() -> UIColor{
        let r = CGFloat.random(in: 0..<1)
        let g = CGFloat.random(in: 0..<1)
        let b = CGFloat.random(in: 0..<1)
        return UIColor.init(red: r, green: g, blue: b, alpha: 1)
    }
}
