# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "harmonious_dictionary/version"

Gem::Specification.new do |s|
  s.name        = "harmonious_dictionary"
  s.version     = HarmoniousDictionary::VERSION
  s.authors     = ["Stephen Kong"]
  s.email       = ["wear63659220@gmail.com"]
  s.homepage    = "https://github.com/wear/harmonious_dictionary"
  s.summary     = %q{filter any words that need to be harmonized}
  s.description = %q{和谐宝典用于检查输入是否包含中文或英文敏感词，并可替换为特殊字符。速度比常规的正则匹配要快10倍以上。生活在天朝，和谐宝典必须人手必备。}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
