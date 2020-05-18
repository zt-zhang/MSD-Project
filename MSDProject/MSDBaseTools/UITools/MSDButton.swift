//
//  MSDButton.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit
import QMUIKit

public class MSDButton {
    
    /// 图片和文字
    public static func imageTitle(_ image: String, _ title: String, _ space: CGFloat, _ position: QMUIButtonImagePosition) -> QMUIButton {
        let btn = QMUIButton()
        let image = UIImage(named: image)
        btn.setTitle(title, for: .normal)
        btn.setImage(image, for: .normal)
        btn.imagePosition = .left
        btn.spacingBetweenImageAndTitle = space
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        return btn
    }
    
    /// 文字和图片的相对位置
    public static func h_imageTitle(_ image: String, _ title: String, _ space: CGFloat) -> QMUIButton {
        return imageTitle(image, title, space, .left)
    }
    public static func h_titleImage(_ image: String, _ title: String, _ space: CGFloat) -> QMUIButton {
        return imageTitle(image, title, space, .right)
    }
    public static func v_imageTitle(_ image: String, _ title: String, _ space: CGFloat) -> QMUIButton {
        return imageTitle(image, title, space, .top)
    }
    public static func v_titleImage(_ image: String, _ title: String, _ space: CGFloat) -> QMUIButton {
        return imageTitle(image, title, space, .bottom)
    }
    
    /// 只有图片
    public static func image(_ image: String) -> QMUIButton {
        let btn = QMUIButton()
        let image = UIImage(named: image)
        btn.setImage(image, for: .normal)
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        
        return btn
    }
}
