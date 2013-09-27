# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activetodo/version'

Gem::Specification.new do |spec|
  spec.name          = 'activetodo'
  spec.version       = ActiveTodo::VERSION
  spec.authors       = ['Tomas Varaneckas']
  spec.email         = ['tomas.varaneckas@gmail.com']
  spec.description   = %q{This gem provides 'TOD*', 'F*XME' and 'XX*' as methods you can use in code}
  spec.summary       = %q{Forget 'TOD*' comments that are sitting in your code forever}
  spec.homepage      = 'https://github.com/spajus/activetodo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'pry-nav'
end
