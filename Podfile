platform :ios, '9.0'

target 'Supernote' do
  use_frameworks!

  pod 'Realm'
  pod 'RealmSwift'
  pod 'ImagePicker', '3.0.0'
  pod 'R.swift'

  target 'SupernoteTests' do
    inherit! :search_paths
    pod 'KIF', git: 'https://github.com/kif-framework/KIF.git', branch: 'master'
    pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git', :commit => 'db706fc'
  end

end
