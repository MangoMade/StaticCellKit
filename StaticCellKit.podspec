#
#  Be sure to run `pod spec lint MMNavigationController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "StaticCellKit"
  s.version      = "0.0.3"
  s.summary      = "Create a static table view by code!"

  s.description  = <<-DESC
  Dequeue a static cell of indexPath,
  and the cell will never be reused by other indexPath.
                   DESC

  s.homepage     = "https://github.com/MangoMade/StaticCellKit"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "MangoMade" => "781132399@qq.com" }
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/MangoMade/StaticCellKit.git", :tag => "#{s.version}" }

  s.source_files  = "StaticCellKit/Source"

  s.requires_arc = true


end
