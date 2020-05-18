//
//  MSDBaseTableViewCell.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

open class MSDBaseTableViewCell: UITableViewCell {
    var disposeBag = DisposeBag()
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.initView()
        self.layoutView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
