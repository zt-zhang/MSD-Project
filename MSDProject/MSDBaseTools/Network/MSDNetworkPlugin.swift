//
//  MSDNetworkPlugin.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import Moya

public class MSDNetWorkPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        
        return request
    }
    public func willSend(_ request: RequestType, target: TargetType) {
        
    }
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        
    }
    func process(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError> {
        
        return result
    }
}
