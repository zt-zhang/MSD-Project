//
//  MSDRadioButton.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/16.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

/// 选择按钮
class MSDRadioButton: QMUIButton {
    let disposeBag = DisposeBag()
    
    static func image(normal: UIImage, selected: UIImage) -> MSDRadioButton {
        let btn = MSDRadioButton()
        btn.setImage(normal, for: .normal)
        btn.setImage(selected, for: .selected)
        btn.rx.tap.map{_ in !btn.isSelected}.bind(to: btn.rx.isSelected).disposed(by: btn.disposeBag)
        return btn
    }
    
    static func imageName(normal: String, selected: String) -> MSDRadioButton {
        let btn = MSDRadioButton()
        let image1 = UIImage(named: normal)
        let image2 = UIImage(named: selected)
        btn.setImage(image1, for: .normal)
        btn.setImage(image2, for: .selected)
        btn.rx.tap.map{_ in !btn.isSelected}.bind(to: btn.rx.isSelected).disposed(by: btn.disposeBag)
        return btn
    }
    
    func setTitle(_ title: String) {
        self.setTitle(title, for: .normal)
        self.imagePosition = .left
        self.spacingBetweenImageAndTitle = 5
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
