
Pod::Spec.new do |s|
  s.name             = 'MKCution'
  s.version          = '2.6.0'
  s.summary          = 'MKCution framework CocoaPods'

  s.description      = <<-DESC
The framework is specifically developed for XcutionTeam.
                       DESC

  s.homepage         = 'https://github.com/x5forever/XcutionTeam.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'x5' => 'x5forever@163.com' }
  s.source           = { :git => 'https://github.com/x5forever/XcutionTeam.git', :tag => 'V2.6.3' }
  s.ios.deployment_target = '8.0'
  s.requires_arc = true
  s.static_framework  =  true
  s.frameworks = "Foundation", "UIKit"
  s.vendored_frameworks = "XcutionDemo/XcutionDemo/MKCution.framework"
  s.resources          = "XcutionDemo/XcutionDemo/MKCution.bundle"
  s.dependency "AFNetworking"
end
