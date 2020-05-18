//
//  UIButton+MSD.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/16.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

extension UIButton {
    public func title(_ title: String, _ font: UIFont, _ textColor: UIColor, _ color: UIColor) {
        self.titleLabel?.font = font
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.backgroundColor = color
    }
}
