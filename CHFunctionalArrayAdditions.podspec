Pod::Spec.new do |s|
  s.name     = 'CHFunctionalArrayAdditions'
  s.version  = '1.0.1'
  s.license  = 'MIT'
  s.summary  = 'Higher order functions for NSArray.'
  s.homepage = 'https://github.com/chaione/CHFunctionalArrayAdditions'
  s.authors   = { 'Terry Lewis' => 'terry@ploverproductions.com' }

  s.source   = { :git => 'https://github.com/chaione/CHFunctionalArrayAdditions.git', :tag => 'v1.0.1' }
  s.description = 'A few functional additions to NSArray such as ch_map: and ch_filter: that make working with NSArray much simpler and cleaner.'
  
  s.platform = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'CHFunctionalArrayAdditions/Source/*.{h,m}'

end
