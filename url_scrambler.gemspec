# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name        = 'url_scrambler'
  spec.version     = '1.0.0'
  spec.authors     = ['Nicholas Bruning', 'Andrei Miulescu', 'Gabe Rotbart']
  spec.email       = ['nicholas.bruning@hooroo.com', 'andrei@hooroo.com']
  spec.homepage    = 'https://github.com/hooroo/url_scrambler'
  spec.description = %q{URL Scrambler leverages MessagePack to turn your objects into portable, URL-safe strings}
  spec.summary     = %q{URL Scrambler leverages MessagePack to turn your objects into portable, URL-safe strings}
  spec.licenses    = ['MIT']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.4.2'
  spec.add_development_dependency 'rspec', '~> 3.3.0'
  spec.add_development_dependency 'pry', '~> 0.10.2'

  spec.add_dependency 'msgpack', '~> 0.6.2'
  spec.add_dependency 'aes', '~> 0.5.0'
end
