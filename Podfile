# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'FirebaseMock' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for FirebaseMock
  pod "FirebaseAuth"
  pod "FirebaseDatabase"
  
  target 'FirebaseMockTests' do
    inherit! :search_paths
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == "FirebaseMock"
            target.build_configurations.each do |config|
                config.build_settings['FRAMEWORK_SEARCH_PATHS'] = '${PODS_ROOT}/**'
            end
        end
    end
end
