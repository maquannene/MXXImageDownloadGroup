Pod::Spec.new do |s|
  s.name     = 'MQImageDownloadGroup'
  s.version  = '1.0'
  s.summary      = "a UI download group based on the SDWebImage, can set up the group and limit group concurrent."
  s.homepage = 'https://github.com/maquannene/MQImageDownloadGroup'
  s.authors   = { 'maquan' => 'maquan@kingsoft.com' }
  s.source   = { :git => 'https://github.com/maquannene/MQImageDownloadGroup.git', :tag => '1.0' }
  s.source_files  = "ImageDownloadGroup/*.{h,m}"
  s.framework    = 'UIKit'
  s.requires_arc = true
end
