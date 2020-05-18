//
//  MSDImage.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

public class MSDImage {
    
    /// 右边箭头
    static let arrow = UIImage.qmui_image(with: .disclosureIndicator, size: CGSize(width: 8, height: 15), tintColor: MSDColor.hex_CCCCCC)!
    
    /// 纯色
    public static func color(_ color: UIColor) -> UIImage {
        return UIImage.qmui_image(with: color, size: CGSize(width: SCREEN_WIDTH, height: 0.5), cornerRadius: 0)!
    }
    
    /// 渐变
    public static func gradient(size: CGSize, colors: [CGColor], locations: [NSNumber], start: CGPoint, end: CGPoint) -> UIImage {
        let layer = CAGradientLayer()
        layer.colors = colors
        layer.locations = locations
        layer.frame = CGRect(origin: CGPoint.zero, size: size)
        layer.startPoint = start
        layer.endPoint = end
        
        return self.layer(layer)
    }
    
    /// layer转image
    public static func layer(_ layer: CALayer) -> UIImage {
        let size = layer.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
