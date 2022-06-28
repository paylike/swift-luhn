Pod::Spec.new do |s|
  s.name             = 'PaylikeLuhn'
  s.swift_version    = '4.0'
  s.version          = '0.1.0'
  s.summary          = 'Luhn implementation based on the JS version for Paylike libraries'
  s.description      = <<-DESC
This packages is a clone of the JS version and responsible for providing a handy
interface to validate card numbers before executing transactions
                       DESC

  s.homepage         = 'https://github.com/paylike/swift-luhn'
  s.license          = { :type => 'BSD-3', :file => 'LICENSE' }
  s.author           = { 'Paylike.io' => 'info@paylike.io' }
  s.source           = { :git => 'https://github.com/paylike/swift-luhn.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/PaylikeLuhn/**/*'
end
