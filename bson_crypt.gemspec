# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bson_crypt/version"

Gem::Specification.new do |s|
  s.name        = "bson_crypt"
  s.version     = BsonCrypt::VERSION
  s.authors     = ["Ben Taitelbaum"]
  s.email       = ["ben@coshx.com"]
  s.homepage    = ""
  s.summary     = %q{Encrypt BSON documents}
  s.description = %q{Allows bson data to be encrypted and decrypted without affecting mongodb operations}

  s.rubyforge_project = "bson_crypt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-mocks"
  s.add_runtime_dependency "bson"
end
