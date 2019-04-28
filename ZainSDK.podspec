#
#  Be sure to run `pod spec lint ZainSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "ZainSDK"
  spec.version      = "0.0.1"
  spec.summary      = "ZainSDK是iOS日常开发常用的工具类"
  spec.description  = "包含UIView、UILabe、UIButton、NSString、UIColor...常用Extenions"
  spec.homepage     = "https://github.com/gouzyi/ZainSDK"

  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "zainguo" => "572249347@qq.com" }
  spec.social_media_url = "https://www.jianshu.com/u/b2d703ff4984"


  spec.source       = { :git => "https://github.com/gouzyi/ZainSDK.git", :tag => spec.version }
  # spec.source_files  = "ZainSDK/**/*.{h,m}"
  spec.source_files  = 'ZainSDK/ZainSDKMacro.h'

  spec.public_header_files = 'ZainSDK/ZainSDKMacro.h'

  spec.requires_arc = true
  spec.platform     = :ios, "8.0"

  spec.subspec 'ZainExtensions' do |e|
    e.source_files = 'ZainSDK/ZainExtensions/**/*'
    e.dependency 'MBProgressHUD'
    # 依赖的系统框架
    e.frameworks = 'UIKit'
  end

  spec.subspec 'NavigationBar' do |nav|

    nav.source_files = 'ZainSDK/NavigationBar/*.{h,m}'
    nav.dependency 'ZainSDK/ZainExtensions'

  end
  spec.subspec 'NetworkManager' do |net|
    net.source_files = 'ZainSDK/NetworkManager/*.{h,m}'
    net.dependency 'AFNetworking'
  end

end
