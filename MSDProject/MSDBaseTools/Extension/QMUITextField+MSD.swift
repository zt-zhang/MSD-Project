//
//  QMUITextField+MSD.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/16.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

extension QMUITextField {

    /// 右侧明文/暗文切换
    public func setSecureEntry(btn: MSDRadioButton) {
        self.addSubview(btn)
        
        btn.snp.makeConstraints { (make) in
            make.right.equalTo(-6)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
        let insets = self.textInsets
        self.isSecureTextEntry = true
        self.textInsets = UIEdgeInsets(top: insets.top, left: insets.left, bottom: insets.bottom, right: 32)
        btn.rx.tap.map{_ in !btn.isSelected}.bind(to: self.rx.isSecureTextEntry).disposed(by: btn.disposeBag)
    }

}
