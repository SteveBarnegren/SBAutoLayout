#
# Be sure to run `pod lib lint SBAutoLayout.podspec' to ensure this is a
# valid spec before submitting.
#


Pod::Spec.new do |s|
  s.name             = "SBAutoLayout"
  s.version          = "0.1.1"
  s.summary          = "Common auto layout operations with a single line of code"

  s.description      = <<-DESC
SBAutoLayout makes it easy to perform common auto layout operations without having to write verbose auto layout syntax.
                       DESC

  s.homepage         = "https://github.com/SteveBarnegren/SBAutoLayout"
  s.license          = 'MIT'
  s.author           = { "Steve Barnegren" => "steve.barnegren@gmail.com" }
  s.source           = { :git => "https://github.com/stevebarnegren/SBAutoLayout.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/stevebarnegren'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'SBAutoLayout/**/*'
 
end
