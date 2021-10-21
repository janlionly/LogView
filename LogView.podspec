Pod::Spec.new do |s|
  s.name             = 'LogView'
  s.version          = '1.1.2'
  s.summary          = 'Put your interesting logs into view for showing.'

  s.description      = <<-DESC
  LogView is a debugging tool view, you can put your interesting logs into view for showing, it support to pan for moving and show/hide using your two finger double tap.
                       DESC

  s.homepage         = 'https://github.com/janlionly/LogView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'janlionly' => 'janlionly@gmail.com' }
  s.source           = { :git => 'https://github.com/janlionly/LogView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/janlionly'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = 'Sources/LogView/*'
  s.frameworks = 'UIKit'
  s.swift_versions = ['4.2', '5.0', '5.1', '5.2']
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
end
