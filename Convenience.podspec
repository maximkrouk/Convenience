Pod::Spec.new do |s|
  s.name             = 'Convenience'
  s.version          = '0.1.0'
  s.summary          = 'Convenient swift framework.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/mx-cat/Convenience'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxim Krouk' => 'id.maximkrouk@gmail.com' }
  s.source           = { :git => 'https://github.com/mx-ßcat Krouk/Convenience.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mxcat_'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.1'
  s.source_files = 'Sources/**/**/**/*'
  s.frameworks = 'UIKit', 'Foundation', 'Security'
end
