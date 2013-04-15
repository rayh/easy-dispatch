# -*- encoding: utf-8 -*-
require File.expand_path('../lib/easy_dispatch/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ray Hilton"]
  gem.email         = ["ray@wirestorm.net"]
  gem.description   = %q{Super simple concurrecy in ruby}
  gem.summary       = %q{Super simple concurrecy in ruby}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  # gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "easy_dispatch"
  gem.require_paths = ["lib"]
  gem.version       = EasyDispatch::VERSION
end
