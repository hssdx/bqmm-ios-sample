Pod::Spec.new do |s|
  s.name             = "BQMM"
  s.version          = "1.3.1"
  s.summary          = "BQMM SDK"
  s.description      = <<-DESC
                          The developer can use this SDK to integrate more and more emoji, such as some static image emoji, or animated emoji
                       DESC

  s.homepage         = "http://biaoqingmm.com/"
  s.license          = 'MIT'
  s.author           = { "harvey" => "dhanf@163.com" }
  s.source           = { :git => "https://github.com/siyanhui/bqmm-ios-sample.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'BQMM/BQMM.framework/Headers/*.h', 'BQMM_EXT/*.{h,m}'
  s.resources = [ 'BQMM/BQMM.bundle', 'BQMM_EXT/*.png' ]
  s.xcconfig  = { 'OTHER_LDFLAGS' => '-ObjC' }
  s.vendored_frameworks = 'BQMM/BQMM.framework'
  s.library = 'z'
  s.framework = 'UIKit'
end
