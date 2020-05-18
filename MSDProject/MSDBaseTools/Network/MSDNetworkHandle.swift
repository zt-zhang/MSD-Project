//
//  MSDNetworkHandle.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import KakaJSON
import Moya

// KakaJSON 键值转换
public protocol MSDUnderlineCased {}
extension MSDUnderlineCased {
    func kj_modelKey(from property: Property) -> ModelPropertyKey {
        property.name.kj.underlineCased()
    }
}

// 在TargetType中进行网络数据转模型（可选）
public protocol MSDTargetTypeLink {
    associatedtype LinkResult
    var map: (Response) -> LinkResult {get}
}
extension MSDTargetTypeLink {
    var map: (Response) -> LinkResult  {{$0 as! Self.LinkResult}}
}
