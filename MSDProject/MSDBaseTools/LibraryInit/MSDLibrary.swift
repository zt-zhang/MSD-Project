//
//  MSDLibrary.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift
import DoraemonKit
import CocoaLumberjack
import SwiftyUserDefaults

class MSDLibrary {
    static func initLib() {
        // 配置键盘
        let manager = IQKeyboardManager.shared
        manager.enable = true
        manager.toolbarDoneBarButtonItemText = "完成"
        manager.shouldResignOnTouchOutside = true
        manager.shouldToolbarUsesTextFieldTintColor = true
        manager.enableAutoToolbar = true
        manager.toolbarManageBehaviour = .byTag;
        
        // 配置QMUI
        let log = QMUILogger.sharedInstance().logNameManager
        log.setEnabled(false, forLogName: "UIView (QMUI)")
        
        // 配置调试工具
        #if DEBUG
        DoraemonManager.shareInstance().install()
        #endif
        
        // 配置日志
        #if DEBUG
        let docmentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let logFileManager = DDLogFileManagerDefault(logsDirectory: docmentsDirectory)
        let fileLogger = DDFileLogger(logFileManager: logFileManager)
        fileLogger.maximumFileSize = 0
        fileLogger.rollingFrequency = 60*60//按小时获取日志
        fileLogger.logFileManager.maximumNumberOfLogFiles = 24*10
        DDLog.add(fileLogger)
        #endif
        
        // 多语言
        object_setClass(Foundation.Bundle.main, Bundle.self)
        
        // 数据库
        let dbV = UInt64(Defaults[\.db_v]) //当前版本
        MSDRealm.initLib(dbV)
    }
}
