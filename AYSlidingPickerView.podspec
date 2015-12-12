Pod::Spec.new do |s|
  s.name             = "AYSlidingPickerView"
  s.version          = "0.1.2"
  s.summary          = "Implementation of a picker view that can be shown by either tapping on or panning the navigation bar"
  s.homepage         = "https://github.com/yenbekbay/AYSlidingPickerView"
  s.license          = 'MIT'
  s.author           = { "Ayan Yenbekbay" => "ayan.yenb@gmail.com" }
  s.source           = { :git => "https://github.com/yenbekbay/AYSlidingPickerView.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
end
