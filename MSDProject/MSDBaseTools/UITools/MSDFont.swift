//
//  MSDFont.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation

public class MSDFont {
    public static func bold(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Bold", size: size)!
    }
    public static func semiBold(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-SemiBold", size: size)!
    }
    public static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Regular", size: size)!
    }
    public static func light(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Light", size: size)!
    }
    public static func thin(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Thin", size: size)!
    }
    public static func medium(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-Medium", size: size)!
    }
    public static func ultraLight(size: CGFloat) -> UIFont {
        return UIFont(name: "AppleSDGothicNeo-UltraLight", size: size)!
    }
}
