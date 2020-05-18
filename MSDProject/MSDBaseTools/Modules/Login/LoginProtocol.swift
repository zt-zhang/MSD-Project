//
//  LoginProtocol.swift
//  Alamofire
//
//  Created by zhangtian on 2020/5/18.
//

import Foundation

public enum MSDStringVerifyError: String, Error {
    case phone = "手机号格式错误"
    case email = "邮箱格式错误"
    case username = "用户名格式错误"
}

public enum MSDStringVerify {
    case phone(String)
    case email(String)
    case username(String)
    
    func verify() -> String? {
        let error: MSDStringVerifyError!
        let raw: String!
        let regular: String!
        
        switch self {
        case .phone(let str):
            raw = str
            error = MSDStringVerifyError.phone
            regular = ""
        case .email(let str):
            raw = str
            error = MSDStringVerifyError.phone
            regular = ""
        case .username(let str):
            raw = str
            error = MSDStringVerifyError.username
            regular = ""
        }
        
        if !NSPredicate(format: "SELF MATCHES %@", regular).evaluate(with: raw) {
            return error.rawValue
        }
        return nil
    }
    
    var value: String {
        switch self {
        case .phone(let str):
            return str
        case .email(let str):
            return str
        case .username(let str):
            return str
        }
    }
}

public enum MSDLoginResult {
    case success
    case failure(String)
}

public protocol MSDLoginProtocol {
    func login(username: MSDStringVerify, password: String, result:(MSDLoginResult)->Void)
    func login(username: MSDStringVerify, code: String, result:(MSDLoginResult)->Void)
    
    func loginRequest(param: [String:String], result:(MSDLoginResult)->Void)
}
public extension MSDLoginProtocol {
    func login(username: MSDStringVerify, password: String, result:(MSDLoginResult)->Void) {
        if let error = username.verify() {result(MSDLoginResult.failure(error)); return}
        let param = ["username":username.value, "passowrd":password]
        self.loginRequest(param: param, result: result)
    }
    func login(username: MSDStringVerify, code: String, result:(MSDLoginResult)->Void) {
        if let error = username.verify() {result(MSDLoginResult.failure(error)); return}
        let param = ["username":username.value, "code":code]
        self.loginRequest(param: param, result: result)
    }
}
