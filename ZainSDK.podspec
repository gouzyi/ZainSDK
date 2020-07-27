#
#  Be sure to run `pod spec lint ZainSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # 项目名
  spec.name         = "ZainSDK"
  # 版本号
  spec.version      = "0.0.2"
  # 简单描述
  spec.summary      = "ZainSDK是iOS日常开发常用的工具类"
  # 详细描述
  spec.description  = "包含UIView、UILabe、UIButton、NSString、UIColor...常用Extenions"
  # 项目的主页
  spec.homepage     = "https://github.com/gouzyi/ZainSDK"
  # 项目遵守的协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  # 作者的邮箱
  spec.author       = { "zainguo" => "572249347@qq.com" }
  # 社交地址
  spec.social_media_url = "https://www.jianshu.com/u/b2d703ff4984"
  # 源码git地址
  spec.source       = { :git => "https://github.com/gouzyi/ZainSDK.git", :tag => spec.version }
  # spec.source_files  = "ZainSDK/**/*.{h,m}"
  # 源文件（可以包含.h和.m）
  spec.source_files  = 'ZainSDK/ZainSDKMacro.h'
  # 头文件(.h文件)
  spec.public_header_files = 'ZainSDK/ZainSDKMacro.h'
  # 是否支持ARC
  spec.requires_arc = true
  # 支持的版本
  spec.platform     = :ios, "8.0"

  spec.subspec 'ZainExtensions' do |e|
    e.source_files = 'ZainSDK/ZainExtensions/**/*'
    e.dependency 'MBProgressHUD'
    # 依赖的系统框架
    e.frameworks = 'UIKit'
  end

  spec.subspec 'ZainHeader' do |h|
    h.source_files = 'ZainSDK/ZainHeader/*.{h}'

  end

  spec.subspec 'NavigationBar' do |nav|

    nav.source_files = 'ZainSDK/NavigationBar/*.{h,m}'
    nav.dependency 'ZainSDK/ZainExtensions'
    nav.dependency 'ZainSDK/ZainHeader'

  end
  spec.subspec 'NetworkManager' do |net|
    net.source_files = 'ZainSDK/NetworkManager/*.{h,m}'
    net.dependency 'AFNetworking'
  end

end
