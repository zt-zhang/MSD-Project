//
//  MSDDefaultTextField.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

/// 左侧带图标
class MSDDefaultTextField: QMUITextField {
    convenience init(placeholder: String, image: String? = nil) {
        self.init()
        self.placeholder = placeholder
        
        if let img = image {
            self.textInsets = UIEdgeInsets(top: 0, left: 33, bottom: 0, right: 33)
            
            let imageView = UIImageView()
            imageView.image = UIImage(named: img)
            imageView.contentMode = .scaleAspectFit
            self.addSubview(imageView)
            
            imageView.snp.makeConstraints { (make) in
                make.centerY.equalTo(self)
                make.left.equalTo(self).offset(6)
                make.size.equalTo(CGSize(width: 10, height: 10))
            }
        }else {
            self.textInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        }
    }
}

