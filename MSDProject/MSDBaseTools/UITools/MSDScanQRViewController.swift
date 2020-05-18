//
//  MSDScanQRViewController.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import UIKit

public class MSDScanQRViewController: LBXScanViewController {
    var barTitle: String?
    
    var resultBlock: ((String) ->Void)?
    
    public convenience init(title: String, result:@escaping (String)->Void) {
        self.init()
        self.barTitle = title
        self.resultBlock = result
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.initController()
    }
    
    public override func initController() {
        self.title = barTitle
        let btn = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(openPhotoAlbum))
        self.navigationItem.rightBarButtonItem = btn
        
        self.navigationController?.navigationBar.isTranslucent = false
        print("沙雕")
        
        var style = LBXScanViewStyle()
        style.animationImage = UIImage(named: "CodeScan.bundle/qrcode_scan_light_green")
        style.centerUpOffset += 10
        self.scanStyle = style
        
        //需要识别后的图像
        setNeedCodeImage(needCodeImg: true)
    }
    
    public override func handleCodeResult(arrayResult: [LBXScanResult]) {
        for result: LBXScanResult in arrayResult {
            if let str = result.strScanned {
                if let result = resultBlock {
                    result(str)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
