
Pod::Spec.new do |s|

  s.name         = "MSDProject"
  s.version      = "0.0.1"
  s.summary      = "敏思达项目通用框架"

  s.description  = <<-DESC
  包括: 网络请求、数据库处理、第三方使用、基类规范、UI组件扩展等
                   DESC

  s.homepage     = "https://github.com/zt-zhang/MSD-Project"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "T_T" => "zt_zhang@protonmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/zt-zhang/MSD-Project.git", :tag => s.version }
  s.source_files = "MSDProject/MSDBaseTools/**/*.swift"
  s.resources = ["MSDProject/MSDBaseTools/Resource/*.bundle"]
  s.framework    = "UIKit","Foundation", "swiftScan"
  s.requires_arc = true

  # UI相关
  s.dependency 'SnapKit'
  s.dependency 'IQKeyboardManagerSwift'
  s.dependency 'QMUIKit'
  #s.dependency 'swiftScan', '~> 1.2.0' #私有库
  s.dependency 'TYPagerController'
  s.dependency 'FSPagerView'
  s.dependency 'Kingfisher'

  # RX 系列
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'RxDataSources'
  
  # 数据存储
  s.dependency 'KeychainAccess'
  s.dependency 'SwiftyUserDefaults'
  s.dependency 'RealmSwift'
  
  # 网络数据处理
  s.dependency 'Moya'
  s.dependency 'KakaJSON'
  
  # Debug、日志管理
  s.dependency 'CocoaLumberjack/Swift'
  s.dependency 'DoraemonKit/Core'
  
end
