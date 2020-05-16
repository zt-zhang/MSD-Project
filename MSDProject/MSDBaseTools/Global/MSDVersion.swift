//
//  MSDVersion.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/16.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

enum MSDVersion {
    case db
}

extension DefaultsKeys {
    var db_v: DefaultsKey<Int> {.init("db_v", defaultValue: 0)}
}

