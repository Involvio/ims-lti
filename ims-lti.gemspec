# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "lib/ims/lti/version"

Gem::Specification.new do |spec|
  spec.name = 'ims-lti'
  spec.version = IMS::LTI::VERSION
  spec.authors = ['Instructure']
  spec.email = 'opensource@instructure.com'
  spec.summary = %q{Ruby library for creating IMS LTI tool providers and consumers}
  spec.homepage = %q{http://github.com/instructure/ims-lti}
  spec.license = 'MIT'

  spec.files = Dir['{lib}/**/*'] + ['LICENSE.txt', 'README.md', 'Changelog.txt']
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 4.0.3'

  spec.add_dependency 'addressable', '~> 2.9'
  spec.add_dependency 'builder', '~> 3.3'
  spec.add_dependency 'faraday', '~> 2.14', '>= 2.14.2'
  spec.add_dependency 'json-jwt', '~> 1.17', '>= 1.17.1'
  spec.add_dependency 'rexml', '~> 3.4', '>= 3.4.4'

  spec.add_development_dependency 'byebug', '~> 13.0'
  spec.add_development_dependency 'guard', '~> 2.20', '>= 2.20.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.7', '>= 4.7.3'
  spec.add_development_dependency 'listen', '~> 3.10'
  spec.add_development_dependency 'pry', '~> 0.16.0'
  spec.add_development_dependency 'rake', '~> 13.4', '>= 13.4.2'
  spec.add_development_dependency 'rspec', '~> 3.13', '>= 3.13.2'
  spec.add_development_dependency 'simplecov', '~> 0.22'
  spec.add_development_dependency 'timecop', '~> 0.9', '>= 0.9.11'
end
