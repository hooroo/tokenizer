# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name     = 'url-scrambler'
  spec.version  = '0.0.1'
  spec.date     = '2014-03-14'
  spec.authors  = ['Andrei Miulescu, Gabe Rotbart']
  spec.email    = 'andrei@hooroo.com'
  spec.homepage = 'https://github.com/hooroo/url-scrambler'
  spec.description   = %q{Url url-scrambler using msgpack}
  spec.summary       = %q{Url url-scrambler using msgpack}
  spec.license  = 'MIT'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'msgpack'
end