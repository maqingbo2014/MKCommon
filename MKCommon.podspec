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
  s.source           = { :git => 'https://github.com/maqingbo2014/MKCommon.git', :tag => s.version.to_s}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  
  s.source_files = 'MKCommon/Classes/MKCommon.h'
  s.public_header_files = 'MKCommon/Classes/MKCommon.h'
  s.ios.deployment_target = '8.0'
  
  s.subspec 'Base' do |ss|
      ss.source_files = 'MKCommon/Classes/Base/*'
      ss.public_header_files = 'MKCommon/Classes/Base/*.h'
      ss.dependency 'MJExtension', '~> 3.0.10'
  end
  
  s.subspec 'Define' do |ss|
      ss.source_files = 'MKCommon/Classes/Define/*'
      ss.public_header_files = 'MKCommon/Classes/Define/*.h'
  end
  
  s.subspec 'NSObjc' do |ss|
      ss.source_files = 'MKCommon/Classes/NSObjc/*'
      ss.public_header_files = 'MKCommon/Classes/NSObjc/*.h'
      ss.dependency 'MKCommon/Tools'
      ss.dependency 'MJExtension', '~> 3.0.10'
  end
  
  s.subspec 'Tools' do |ss|
      ss.source_files = 'MKCommon/Classes/Tools/*'
      ss.public_header_files = 'MKCommon/Classes/Tools/*.h'
      ss.dependency 'MKCommon/Define'
  end
  
  s.subspec 'UIKit' do |ss|
      ss.source_files = 'MKCommon/Classes/UIKit/*'
      ss.public_header_files = 'MKCommon/Classes/UIKit/*.h'
      ss.dependency 'MKCommon/Tools'
      ss.dependency 'SDWebImage', '~> 3.8.2'
      ss.frameworks = 'UIKit'
  end
  
  # s.resource_bundles = {
  #   'MKCommon' => ['MKCommon/Assets/*.png']
  # }

end
