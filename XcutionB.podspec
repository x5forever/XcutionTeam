
Pod::Spec.new do |s|
  s.name             = 'XcutionB'
  s.version          = '2.9.2'
  s.summary          = 'XcutionB framework CocoaPods'

  s.description      = <<-DESC
The framework is specifically developed for XcutionTeam.
                       DESC

  s.homepage         = 'https://github.com/x5forever/XcutionTeam.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'x5' => 'x5forever@163.com' }
  s.source           = { :git => 'https://github.com/x5forever/XcutionTeam.git', :tag => 'V2.9.6' }
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.static_framework  =  true
  s.frameworks = "Foundation", "UIKit"
  s.vendored_frameworks = "XcutionDemo/XcutionDemo/XcutionB.framework"
  # s.resources          = "XcutionDemo/XcutionDemo/XcutionB.bundle"
  s.dependency "AFNetworking", '~> 4.0.1'
  s.dependency "SDWebImage"
  s.dependency "GTMBase64"
end
