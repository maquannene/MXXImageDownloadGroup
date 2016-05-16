Pod::Spec.new do |s|
  s.name     = 'MSDImageDownloadGroup'
  s.version  = '1.3'
  s.summary  = "A image download group based on the SDWebImage, UIImageView download can divide groups and limit number of concurrent in group."
  s.homepage = 'https://github.com/maquannene/MSDImageDownloadGroup'
  s.authors  = { 'maquan' => 'maquan@kingsoft.com' }
  s.source   = { :git => 'https://github.com/maquannene/MSDImageDownloadGroup.git', :tag => '1.3' }
  s.source_files  = "MSDImageDownloadGroup/*.{h,m}"
  s.framework    = 'UIKit'
  s.dependency  'SDWebImage', '~> 3.6'
  s.requires_arc = true
end
