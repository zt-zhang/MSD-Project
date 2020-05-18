//
//  MSDGlobal.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation

@_exported import RxSwift
@_exported import RxCocoa
@_exported import RxDataSources
@_exported import SnapKit
@_exported import QMUIKit
@_exported import CocoaLumberjack

//MARK: 获取主屏幕和屏幕宽度与高度
var SCREEN_SIZE: CGSize {UIScreen.main.bounds.size}
var SCREEN_WIDTH: CGFloat {SCREEN_SIZE.width}
var SCREEN_HEIGHT: CGFloat {SCREEN_SIZE.height}
var SCALE_H: CGFloat {SCREEN_HEIGHT/667}
var SCALE_W: CGFloat {SCREEN_WIDTH/375}

//MARK: 国际化
func msd_str(_ key: String) -> String {
    NSLocalizedString(key, comment:"")
}
func msd_str(_ key: String, _ comment: String) -> String {
    NSLocalizedString(key, comment:comment)
}

//MARK: Log
public class MSDLog {
    /// 日志记录
    func info(_ str: String) {
        DDLogInfo(str)
    }
    /// 错误记录
    func error(_ str: String) {
        DDLogWarn(str)
    }
    /// 正在调试
    func debug(_ str: String) {
        DDLogDebug(str)
    }
    /// 长数据
    func verbose(_ str: String) {
        DDLogVerbose(str)
    }
}
