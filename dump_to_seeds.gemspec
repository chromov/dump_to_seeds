# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dump_to_seeds/version"

Gem::Specification.new do |s|
  s.name        = "dump_to_seeds"
  s.version     = DumpToSeeds::VERSION
  s.authors     = ["Dmitri Chromov"]
  s.email       = ["chromov@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Dump model to seeds-like ruby code}
  s.description = %q{Dump model to seeds-like ruby code}

  s.rubyforge_project = "dump_to_seeds"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "activerecord"
end
