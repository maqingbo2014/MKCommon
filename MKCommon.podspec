#
# Be sure to run `pod lib lint MKCommon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKCommon'
  s.version          = '1.0.3'
  s.summary          = '这是一个基础组件库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '这是一个基础组件库，包含一些常用的方法、分类的积累'

  s.homepage         = 'https://github.com/maqingbo2014/MKCommon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'maqingbo2014' => '249086205@qq.com' }
  s.source           = { :git => 'https://github.com/maqingbo2014/MKCommon.git', :tag => s.version.to_s :submodules => true}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MKCommon/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MKCommon' => ['MKCommon/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MJExtension', '~> 3.0.10'
  s.dependency 'SDWebImage', '~> 3.8.2'
  # s.dependency 'AFNetworking', '~> 2.3'
end
