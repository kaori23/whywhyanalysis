# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end

target 'whywhyanalysisApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for whywhyanalysisApp
  pod 'RealmSwift'
  pod 'R.swift'
  pod 'SwiftLint'
  pod 'SwiftMessages'
  pod 'IQKeyboardManager'
  pod 'TextFieldEffects'

  target 'whywhyanalysisAppTests' do
    inherit! :search_paths
   # Pods for testing
  end

end
