#
#  Be sure to run `pod spec lint MSD-Project.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "MSD-Project"
  s.version      = "0.0.1"
  s.summary      = "敏思达项目通用框架"

  s.description  = <<-DESC
  包括: 网络请求、数据库处理、第三方使用、基类规范、UI组件扩展等
                   DESC

  s.homepage     = "https://github.com/zt-zhang/MSD-Project"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "T_T" => "zt_zhang@protonmail.com" }
  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/zt-zhang/MSD-Project.git", :tag => s.version }

  s.source_files  = "MSDProject/**/*.{h,m,swift}"
  s.requires_arc = true

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # UI相关
  s.dependency 'SnapKit'
  s.dependency 'IQKeyboardManagerSwift'
  s.dependency 'QMUIKit'
  s.dependency 'swiftScan', '~> 1.2.0'
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
