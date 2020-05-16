//
//  MSDBaseProtocols.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

protocol MSDViewControllerNorm {
    /// 修改控制器导航栏，颜色等
    func initController()
    ///添加UI组件
    func initView()
    ///事件相应处理
    func handleEvents()
    ///隐藏导航栏，默认不隐藏
    func naviBarHidden() -> Bool
}
extension MSDViewControllerNorm {
    func naviBarHidden() -> Bool {false}
}


protocol MSDViewNorm  {
    ///添加UI组件
    func initView()
    ///布局组件
    func layoutView()
    ///UI 数据更新
    func setView(data: Any?)
}

protocol MSDSwitchStyleNorm {
    ///枚举类型
    associatedtype T
    ///根据枚举值更新UI样式
    func switchStyle(_: T)
}
