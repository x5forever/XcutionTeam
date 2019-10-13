
Pod::Spec.new do |s|
  s.name             = 'XcutionA'
  s.version          = '1.1.0'
  s.summary          = 'XcutionA framework CocoaPods'

  s.description      = <<-DESC
The framework is specifically developed for XcutionTeam.
                       DESC

  s.homepage         = 'https://github.com/x5forever/XcutionTeam.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'x5' => 'x5forever@163.com' }
  s.source           = { :git => 'https://github.com/x5forever/XcutionTeam.git', :tag => 'V1.1.1' }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.static_framework  =  true
  s.frameworks = "Foundation", "UIKit", "WebKit"
  s.vendored_frameworks = "XcutionDemo/XcutionDemo/XcutionA.framework"
  s.resources          = "XcutionDemo/XcutionDemo/XcutionA.bundle"
  s.dependency "AFNetworking"
  s.dependency "GTMBase64"
  s.dependency "SVWebView"
end
