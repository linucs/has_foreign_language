# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_foreign_language/version"

Gem::Specification.new do |s|
  s.name        = "has_foreign_language"
  s.version     = HasForeignLanguage::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["dalpo"]
  s.email       = ["info@andreadalponte.com"]
  s.homepage    = "https://github.com/dalpo/has_foreign_language"
  s.summary     = %q{Easy database internationalization gem for Ruby on Rails}
  s.description = %q{Easy database internationalization gem for Ruby on Rails}

  s.rubyforge_project = "has_foreign_language"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = [".","lib"]
end
