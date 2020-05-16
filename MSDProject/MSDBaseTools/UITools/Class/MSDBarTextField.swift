//
//  MSDBarTextField.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

/// 编辑中显示提示条
class MSDBarTextField: MSDDefaultTextField {
    lazy var bar: UIView = {
        let view = UIView()
        view.alpha = 0
        return view
    }()
    let disposeBag = DisposeBag()
    
    convenience init(placeholder: String, image: String? = nil, barColor: UIColor) {
        self.init(placeholder: placeholder, image: image)
        self.bar.backgroundColor = barColor
        self.initView()
    }
    
    override func initView() {
        self.addSubview(bar)
        
        bar.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self.snp.bottom)
            make.size.equalTo(CGSize(width: 125, height: 2))
        }
        
        self.rx.controlEvent([.editingDidBegin]).asObservable().subscribe(onNext: { _ in
            UIView.animate(withDuration: 0.3) {
                self.bar.alpha = 1
            }
        }).disposed(by: disposeBag)
        self.rx.controlEvent([.editingDidEnd]).asObservable().subscribe(onNext: { _ in
            UIView.animate(withDuration: 0.3) {
                self.bar.alpha = 0
            }
        }).disposed(by: disposeBag)
    }
}
