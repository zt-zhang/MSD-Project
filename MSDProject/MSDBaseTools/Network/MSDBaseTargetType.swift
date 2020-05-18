//
//  MSDBaseTargetType.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import Moya

// Moya TargetType 复用
public protocol MSDBaseTargetType: TargetType {}
extension MSDBaseTargetType {
    var baseURL: URL {
        return URL(string: "http://61.145.108.146:22238")!
    }
    
    var validationType: ValidationType {.successCodes}
    var sampleData: Data {Data()}
    var headers: [String : String]? {nil}
    
    func parameters(data: String) -> [String:Any] {
        var parameters = [String: Any]()
        parameters["data"] = data
        parameters["devices"] = "android"
        parameters["encode"] = ""
        parameters["format"] = "json"
        parameters["method"] = "mdmapp.checkUser"
        parameters["sessionid"] = ""
        parameters["v"] = "1.0"
        return parameters
    }
}
public protocol MSDGitTrgetType: MSDBaseTargetType {}
extension MSDGitTrgetType {
    var method: Moya.Method {.get}
}
public protocol MSDPostTrgetType: MSDBaseTargetType {}
extension MSDPostTrgetType {
    var method: Moya.Method {.post}
}
