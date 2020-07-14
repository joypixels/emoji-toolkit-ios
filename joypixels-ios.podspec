Pod::Spec.new do |s|
  s.name             = 'joypixels-ios'
  s.version          = '6.0.0'
  s.summary          = 'Official JoyPixels iOS Emoji Toolkit'
  s.description      = 'JoyPixels iOS Emoji Toolkit is used to convert emoji into various formats, including conversion to JoyPixels emoji images.'
  s.homepage         = 'https://www.joypixels.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'JoyPixels Inc' => 'support@joypixels.com' }
  s.source           = { :git => 'https://github.com/joypixels/emoji-toolkit-ios.git', :tag => "v#{s.version.to_s}" }
  s.social_media_url = 'https://twitter.com/joypixels'
  s.ios.deployment_target = '9.0'
  s.source_files = 'JoyPixels/JoyPixels/*.swift'
  s.swift_version = '4.2'
end
