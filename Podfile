# Uncomment the next line to define a global platform for your project
#platform :ios, '9.0'

target 'pawnder' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for pawnder

pod "Appirater"
pod 'SDWebImage'

#Firebase

pod 'FirebaseCore'
pod 'FirebaseAnalytics'
pod 'FirebaseAuth'
pod 'FirebaseCrashlytics'
pod 'FirebaseDatabase'
pod 'FirebaseStorage'
pod 'lottie-ios'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.4'
    end
  end
end
end
