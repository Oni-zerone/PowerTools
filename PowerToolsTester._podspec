#
# Be sure to run `pod lib lint SOTViewModelRepresenter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'PowerToolsTester'
    s.version          = '0.4.0'
    s.summary          = 'Tools tester for fast and modular app development.'
    s.swift_version    = '5.0'
    
    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!
    
    s.description      = <<-DESC
    Fast development tools with a better way to use UICollectionViews
    DESC
    
    s.homepage         = 'https://github.com/Oni-zerone/PowerTools'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andrea Altea' => 'oni.zerone@gmail.com' }
    s.source           = { :git => 'https://github.com/Oni-zerone/PowerTools.git', :tag => s.version.to_s + '-tester' }
    s.social_media_url = 'https://twitter.com/Oni_zerone'
    
    s.ios.deployment_target = '9.0'
    
    s.default_subspec = 'CoreTester'
    s.subspec 'CoreTester' do |sp|
        sp.source_files = 'PowerTools/Tests/Core/Classes/**/*'
        sp.framework = "XCTest"
        sp.requires_arc = true
        sp.user_target_xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PLATFORM_DIR)/Developer/Library/Frameworks' }
        sp.pod_target_xcconfig = {
            'APPLICATION_EXTENSION_API_ONLY' => 'YES',
            'ENABLE_BITCODE' => 'NO',
            'OTHER_LDFLAGS' => '$(inherited) -Xlinker -no_application_extension',
        }
        sp.dependency 'PowerTools/Core', '~> 0.4'
        sp.dependency 'PowerTools/CollectionVM', '~> 0.4'
    end
end
