#
#  Be sure to run `pod spec lint BWExtensionKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "BWExtensionKit"
  spec.version      = "0.0.4"
  spec.summary      = "一些扩展及封装。"

  spec.description  = <<-DESC
  这是可以添加描述
                   DESC

  spec.homepage     = "https://github.com/BWLi420/BWExtensionKit"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = "BWLi420"
  # spec.social_media_url   = "https://twitter.com/BWLi420"

  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"
  spec.source       = { :git => "https://github.com/BWLi420/BWExtensionKit.git", :tag => "#{spec.version}" }

  spec.source_files  = "BWExtensionKit/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  spec.frameworks = "UIKit", "Foundation", "Security"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

  spec.subspec "Category" do |cg| # 分类扩展
    cg.source_files = "BWExtensionKit/Category/*.{h,m}"
    cg.frameworks   = "Security"
  end
  
  spec.subspec "MHud" do |mu| # 封装 MBProgressHUD
    mu.source_files = "BWExtensionKit/MHud/*.{h,m}"
    mu.dependency "MBProgressHUD"
    mu.frameworks = "UIKit", "Foundation"
  end
  
  spec.subspec "SHud" do |su| # 封装 SVProgressHUD
    su.source_files = "BWExtensionKit/SHud/*.{h,m}"
    su.dependency "SVProgressHUD"
    su.frameworks = "UIKit", "Foundation"
  end
  
  spec.subspec "GeneralTool" do |gt| # 工具类
    gt.source_files = "BWExtensionKit/GeneralTool/**/*.{h,m}"
    gt.frameworks = "Foundation"
    
    gt.subspec "Location" do |loc| # 定位
      loc.source_files = "BWExtensionKit/GeneralTool/Location/*.{h,m}"
    end
    
    gt.subspec "Regular" do |rg| # 正则
      rg.source_files = "BWExtensionKit/GeneralTool/Regular/*.{h,m}"
    end
  end
  
  # 依赖库
#  spec.dependency "JJException"
end
