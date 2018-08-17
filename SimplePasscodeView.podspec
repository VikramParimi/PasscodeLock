Pod::Spec.new do |spec|
  spec.name         = "SimplePasscodeView"
  spec.version      = "0.0.1"
  spec.license      = { :type => 'MIT' }
  spec.homepage     = "https://github.com/vkrmchowdary/PasscodeView"
  spec.author       = { "Geeko Coco" => "vikramchowdary.102@gmail.com" }
  spec.summary      = "A Passcode component for iOS"
  spec.description  = <<-DESC
                   SimplePasscodeView mimics iOS Passcode behaviour with more customizable options and can be easily integrated into any project.
                   DESC
spec.source       = { :git => "https://github.com/vkrmchowdary/PasscodeView.git", :tag => spec.version.to_s}
  spec.source_files = 'SimplePasscodeView/PasscodeView/*'
  spec.ios.framework = 'UIKit'
end
