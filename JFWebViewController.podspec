Pod::Spec.new do |s|
  s.name         = "JFWebViewController"
  s.version      = "0.0.1"
  s.summary      = "A simple Webview Controller."
  s.homepage     = "https://github.com/jfreyre/JFWebViewController"
  s.license      = 'MIT'

  s.author       = { "jfreyre" => "jerome.freyre@gmail.com" }

  s.source       = { :git => "https://github.com/jfreyre/JFWebViewController.git", :commit => "64cc0a1fc971d2426625d2a19eeaf8528f9526e6" }

  s.platform     = :ios, '5.0'

  s.source_files = 'Classes', 'JFWebController/*.{h,m}'
  s.resources = "JFWebController/*.png"


  s.framework  = 'MessageUI'

  s.requires_arc = true
end
