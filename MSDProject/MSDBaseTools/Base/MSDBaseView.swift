//
//  MSDBaseView.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

open class MSDBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
        self.layoutView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


