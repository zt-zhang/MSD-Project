//
//  UIView+MSD.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

extension UIView {
    public func bottomBorder(color: UIColor) {
        self.border(color: color, position: .bottom)
    }
    public func leftBorder(color: UIColor) {
        self.border(color: color, position: .left)
    }
    public func rightBorder(color: UIColor) {
        self.border(color: color, position: .right)
    }
    public func topBorder(color: UIColor) {
        self.border(color: color, position: .top)
    }
    public func allBorder(color: UIColor) {
        self.border(color: color, position: [.bottom, .top, .left, .right])
    }
    
    /// 加边框
    public func border(color: UIColor, position: QMUIViewBorderPosition) {
        self.qmui_borderColor = color
        self.qmui_borderWidth = 0.5
        self.qmui_borderLocation = .inside
        self.qmui_borderPosition = position
    }
    /// 去边框
    public func clearBorder() {
        self.qmui_borderWidth = 0
    }
    
    /// 加圆角
    public func cornerRadius(_ radius: CGFloat) {
        self.cornerRadius(radius, corners: [.layerMaxXMaxYCorner,
                                            .layerMaxXMaxYCorner,
                                            .layerMinXMinYCorner,
                                            .layerMinXMaxYCorner])
    }
    public func cornerRadius(_ radius: CGFloat, corners: QMUICornerMask) {
        self.layer.cornerRadius = radius
        self.layer.qmui_maskedCorners = corners
    }
    /// 去圆角
    public func clearCorner() {
        self.layer.cornerRadius = 0
    }
    
    /// 加阴影
    public func shadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
    }
    /// 去阴影
    public func clearShadow() {
        self.layer.shadowColor = nil
    }
}

extension UIView {
    
    public var x:CGFloat{
        get{
            return self.frame.origin.x
        } set{
            self.frame.origin.x = newValue
        }
    }
    
    public var y:CGFloat{
        get{
            return self.frame.origin.y
        }set{
            self.frame.origin.y = newValue
        }
    }
    
    public var centerX:CGFloat{
        get{
            return self.center.x
        }set{
            self.centerX = newValue
        }
    }
    
    public var centerY:CGFloat{
        get{
            return self.center.y
        }set{
            self.centerY = newValue
        }
    }
    
    public var width:CGFloat{
        get{
            return self.frame.size.width
        }set{
            self.frame.size.width = newValue
        }
    }
    
    public var height:CGFloat{
        get{
            return self.frame.size.height
        }set{
            self.frame.size.height = newValue
        }
    }
    public var size:CGSize{
        get{
            return self.frame.size
        }set{
            self.frame.size = newValue
        }
    }
    
    public var origin:CGPoint{
        get{
            return self.frame.origin
        }set{
            self.frame.origin = newValue
        }
    }
    
    // 关联 SB 和 XIB
    // 设置圆角
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // 阴影半径，默认3
    @IBInspectable public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    // 阴影透明度，默认0
    @IBInspectable public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    // 阴影颜色
    @IBInspectable public var shadowColor: UIColor? {
        get {
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!) : nil
        }
        
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    // 阴影偏移量，和shadowRadius配合使用
    @IBInspectable public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    // 图层的显示顺序(层级关系)
    @IBInspectable public var zPosition: CGFloat {
        get {
            return layer.zPosition
        }
        
        set {
            layer.zPosition = newValue
        }
    }
}
