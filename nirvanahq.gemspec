# coding: UTF-8

Gem::Specification.new do |s|
  s.name              = "nirvanahq"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Mitchell Amihod"]
  s.email             = ["mitchell.amihod@gmail.com"]
  s.homepage          = "http://github.com/meeech/nirvanahq"
  s.summary           = "Gem for NirvanaHQ.com"
  s.description       = "Gem for interacting with the NirvanaHQ API. Very Alpha"
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.6"
  
  # If you have runtime dependencies, add them here
  s.add_runtime_dependency "json", ">= 0"
  
  # If you have development dependencies, add them here
  # s.add_development_dependency "another", "= 0.9"

  # The list of files to be contained in the gem
  s.files         = `git ls-files`.split("\n")
  # s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  # s.extensions    = `git ls-files ext/extconf.rb`.split("\n")
  
  s.require_path = 'lib'

  # For C extensions
  # s.extensions = "ext/extconf.rb"
end
