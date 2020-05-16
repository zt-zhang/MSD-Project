//
//  MSDNetWork.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import Moya

class MSDNetWork {
    static func request<MSDTarget: MSDTargetTypeLink&TargetType>(target: MSDTarget) -> Observable<MSDTarget.LinkResult> {
        return Observable<MSDTarget.LinkResult>.create { maybe in
            
            let provider = MoyaProvider<MSDTarget>(plugins: [MSDNetWorkPlugin()])
            
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    let result = target.map(response)
                    maybe.onNext(result)
                case .failure(let error):
                    maybe.onError(error)
                }
            }
            return Disposables.create()
        }.share(replay: 1)
    }
}   
