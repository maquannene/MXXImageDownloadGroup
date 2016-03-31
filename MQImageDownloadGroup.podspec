Pod::Spec.new do |s|
  s.name     = 'MQImageDownloadGroup'
  s.version  = '1.2'
  s.summary  = "A image download group based on the SDWebImage, UIImageView download can divide groups and limit number of concurrent in group."
  s.homepage = 'https://github.com/maquannene/MQImageDownloadGroup'
  s.authors  = { 'maquan' => 'maquan@kingsoft.com' }
  s.source   = { :git => 'https://github.com/maquannene/MQImageDownloadGroup.git', :tag => '1.2' }
  s.source_files  = "ImageDownloadGroup/*.{h,m}"
  s.framework    = 'UIKit'
  s.dependency  'SDWebImage', '~> 3.6'
  s.requires_arc = true
end
