#
# Be sure to run `pod lib lint FGPopupScheduler-Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FGPopupScheduler-Swift'
  s.version          = '0.5.0'
  s.summary          = 'FGPopupScheduler for Swift'
  s.homepage         = "https://github.com/FoneG/FGPopupScheduler-Swift"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '15757127193@163.com' => '15757127193@163.com' }
  s.source           = { :git => 'git@github.com:FoneG/FGPopupScheduler-Swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target    = '9.0'

  s.libraries = "c++.1"
  s.requires_arc = true
  s.swift_version = '5.0'
  s.static_framework = true

  s.vendored_frameworks      = 'Vendor/FGPopupScheduler.framework'

end
