# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'url_scrambler/version'

Gem::Specification.new do |spec|
  spec.name     = 'url_scrambler'
  spec.version  = UrlScrambler::VERSION
  spec.date     = '2014-03-14'
  spec.authors  = ['Andrei Miulescu, Gabe Rotbart']
  spec.email    = 'andrei@hooroo.com'
  spec.homepage = 'https://github.com/hooroo/url-scrambler'
  spec.description   = %q{Url url-scrambler using msgpack}
  spec.summary       = %q{Url url-scrambler using msgpack}
  spec.license  = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'msgpack'
end