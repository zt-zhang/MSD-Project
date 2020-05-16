//
//  AppSettings.swift
//  MSDProject
//
//  Created by zhangtian on 2020/5/15.
//  Copyright © 2020 zhangtian. All rights reserved.
//

import Foundation

class AppSettings: NSObject {

    fileprivate static let kSharedSettingsKey = "DefaultUserSettings"

    static let shared: AppSettings = {
        let appSettings: AppSettings
        if #available(iOS 11.0, *) {
            if let savedData = UserDefaults.standard.object(forKey: AppSettings.kSharedSettingsKey) as? Data,
                let defaultSettings = try? NSKeyedUnarchiver.unarchivedObject(ofClasses: [AppSettings.self], from: savedData) {
                appSettings = defaultSettings as! AppSettings
            } else {
                appSettings = AppSettings()
            }
        } else {
            if let savedData = UserDefaults.standard.object(forKey: AppSettings.kSharedSettingsKey) as? Data,
                let defaultSettings = NSKeyedUnarchiver.unarchiveObject(with: savedData) {
                appSettings = defaultSettings as! AppSettings
            } else {
                appSettings = AppSettings()
            }
        }

        return appSettings
    }()

    static func saveSharedInstance() {
        if #available(iOS 11.0, *) {
            let data = try? NSKeyedArchiver.archivedData(withRootObject: AppSettings.shared, requiringSecureCoding: true)
            UserDefaults.standard.set(data, forKey: AppSettings.kSharedSettingsKey)
        } else {
            let data = NSKeyedArchiver.archivedData(withRootObject: AppSettings.shared)
            UserDefaults.standard.set(data, forKey: AppSettings.kSharedSettingsKey)
        }
        
    }

    enum Language: String {
        /// 请注意, 这个命名不是随意的, 是根据你本地的语言包,可以show in finder 看到. en.lproj / zh-Hans.lproj
        case Chinese = "zh-Hans"
        case English = "en"
        var code: String {
            return rawValue
        }
    }
    
    /// 判断手机语言是不是中文
    static func localeIsChinese() -> Bool {
        if let lang = Locale.preferredLanguages.first {
            return lang.hasPrefix("zh") ? true : false ;
        } else {
            return false
        }

    }

    var language: Language
    override init() {
        // 第一次初始语言, 看手机是什么语言
        language = AppSettings.localeIsChinese() ? .Chinese : .English
        super.init()
    }
}


private var bundleByLanguageCode: [String: Foundation.Bundle] = [:]
extension AppSettings.Language {
    var bundle: Foundation.Bundle? {
        /// 存起来, 避免一直创建
        if let bundle = bundleByLanguageCode[code] {
            return bundle
        } else {
            let mainBundle = Foundation.Bundle.main
            if let path = mainBundle.path(forResource: code, ofType: "lproj"),
                let bundle = Foundation.Bundle(path: path) {
                bundleByLanguageCode[code] = bundle
                return bundle
            } else {
                return nil
            }
        }
    }
}


/// 首先, 我们会在启动时设置成我们自己的Bundle,这样就可以做到,当使用时会调用这个方法.
class Bundle: Foundation.Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = AppSettings.shared.language.bundle {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
