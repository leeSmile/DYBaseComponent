#
# Be sure to run `pod lib lint DYBaseComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DYBaseComponent'
  s.version          = '0.8.0'
  s.summary          = ' DYBaseComponent '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  DYBaseComponent contains  Common components
                       DESC

  s.homepage         = 'https://github.com/leeSmile/DYBaseComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '244645877@qq.com' => '244645877@qq.com' }
  s.source           = { :git => 'https://github.com/leeSmile/DYBaseComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DYBaseComponent/Classes/**/*'

    # 子组件 NSDate
    s.subspec 'NSDate' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/NSDate'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/NSDate/*.h'
    end
    # 子组件 NSString
    s.subspec 'NSString' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/NSString'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/NSString/*.h'
    end
    # 子组件 UIButton
    s.subspec 'UIButton' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/UIButton'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/UIButton/*.h'
    end
    # 子组件 UIImage
    s.subspec 'UIImage' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/UIImage'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/UIImage/*.h'
    end
    # 子组件 UILabel
    s.subspec 'UILabel' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/UILabel'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/UILabel/*.h'
    end
    # 子组件 UITabBar
    s.subspec 'NSDate' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/UITabBar'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/UITabBar/*.h'
    end
    # 子组件 UIView
    s.subspec 'UIView' do |ss|
    ss.source_files = 'DYBaseComponent/Classes/Category/UIView'
    ss.public_header_files = 'DYBaseComponent/Classes/Category/UIView/*.h'
    end


  # s.resource_bundles = {
  #   'DYBaseComponent' => ['DYBaseComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
