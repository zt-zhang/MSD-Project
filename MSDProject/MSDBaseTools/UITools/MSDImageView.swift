//
//  MSDImageView.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

class MSDImageView {
    static func imageName(_ name: String) -> UIImageView {
        let view = UIImageView()
        view.image = UIImage(named: name)
        view.contentMode = .scaleAspectFit
        return view
    }
    static func image(_ image: UIImage) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        return view
    }
}
