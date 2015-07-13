Pod::Spec.new do |s|
  s.name         = "J2ObjC"
  s.version      = "0.9.7"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.summary      = "J2ObjC's JRE emulation library, emulates a subset of the Java runtime library."
  s.homepage     = "https://github.com/google/j2objc"
  s.author       = "Google Inc."
  s.source       = { :git => "https://github.com/jefflovejapan/j2objc.git", :tag => s.version.to_s }

  s.requires_arc = false
  s.header_mappings_dir = "dist/include"
  
  # Top level attributes can't be specified by subspecs.
  s.prepare_command = <<-CMD
    scripts/download_distribution.sh
  CMD

  
  s.source_files = 'jre_emul/Classes/*.{h,m}', 'dist/include/java/io/**/*.{h,m}', 'dist/include/java/lang/**/*.{h,m}', 'dist/include/java/util/*.{h,m}'
  s.public_header_files = 'jre_emul/Classes/*.h', 'dist/include/java/io/**/*.h', 'dist/include/java/lang/**/*.h', 'dist/include/java/util/*.h'
  s.vendored_libraries = 'dist/lib/libj2objc_main.a', 'dist/lib/libjre_emul.a'
  s.frameworks = 'Security'

end
