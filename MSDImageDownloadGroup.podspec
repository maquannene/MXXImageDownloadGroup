Pod::Spec.new do |s|
  s.name     = 'MSDImageDownloadGroup'
  s.version  = '2.0'
  s.summary  = "A image download group based on the SDWebImage, UIImageView download can divide groups and limit number of concurrent in group."
  s.homepage = 'https://github.com/maquannene/MXXImageDownloadGroup'
  s.authors  = { 'maquan' => 'maquan@kingsoft.com' }
  s.source   = { :git => 'https://github.com/maquannene/MXXImageDownloadGroup.git', :tag => '2.0' }
  s.source_files  = "MSDImageDownloadGroup/*.{h,m}"
  s.framework    = 'UIKit'
  s.dependency  'SDWebImage', '~> 3.6'
  s.requires_arc = true
end
