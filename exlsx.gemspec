# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exlsx/version', __FILE__)

Gem::Specification.new do |spec|
	spec.name          = 'exlsx'
	spec.version       = Exlsx::VERSION
	spec.summary       = 'Extensions to axlsx'
	spec.description   = 'Extensions that make it easier/simpler to use axlsx, partiacularily in relation to styling'

	spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
	spec.files         = `git ls-files`.split("\n")
	spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

	spec.author        = 'Phil Schalm'
	spec.homepage      = 'https://github.com/pnomolos'

	spec.add_development_dependency "bundler", "~> 1.6"
	spec.add_development_dependency "rake"
end
