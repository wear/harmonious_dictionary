# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "harmonious_dictionary/version"

Gem::Specification.new do |s|
  s.name        = "harmonious_dictionary"
  s.version     = HarmoniousDictionary::VERSION
  s.authors     = ["Stephen"]
  s.email       = ["wear63659220@gmail.com"]
  s.homepage    = "https://github.com/wear/harmonious_dictionary"
  s.summary     = %q{filter any words that need to be harmonized}
  s.description = %q{filter any words that need to be harmonized}

  s.rubyforge_project = "url_formatter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  #s.add_development_dependency "rspec"
end
