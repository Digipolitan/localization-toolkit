Pod::Spec.new do |s|
s.name = "LocalizationToolkit"
s.version = "1.3.0"
s.summary = "Localization helper for swift project"
s.homepage = "https://github.com/Digipolitan/localization-toolkit"
s.authors = "Digipolitan"
s.source = { :git => "https://github.com/Digipolitan/localization-toolkit.git", :tag => "v#{s.version}" }
s.license = { :type => "BSD", :file => "LICENSE" }
s.source_files = 'Sources/LocalizationToolkit/*.{swift,h}'
s.ios.source_files = 'Sources/LocalizationToolkit/UIKit/*.{swift,h}'
s.tvos.source_files = 'Sources/LocalizationToolkit/UIKit/*.{swift,h}'
s.watchos.source_files = 'Sources/LocalizationToolkit/UIKit/*.{swift,h}'
s.macos.source_files = 'Sources/LocalizationToolkit/AppKit/*.{swift,h}'
s.ios.deployment_target = '8.0'
s.watchos.deployment_target = '2.0'
s.tvos.deployment_target = '9.0'
s.osx.deployment_target = '10.10'
s.swift_version = '5.0'
end
