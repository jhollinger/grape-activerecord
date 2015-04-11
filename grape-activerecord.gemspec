# encoding: utf-8

require File.expand_path('../lib/grape/activerecord/version.rb', __FILE__)
Gem::Specification.new do |gem|
  gem.name = 'grape-activerecord'
  gem.version = Grape::ActiveRecord::VERSION
  gem.date = '2015-04-11'

  gem.description = 'Extends Grape with simple ActiveRecord integration'
  gem.summary = 'ActiveRecord integration for Grape'
  gem.homepage = 'https://github.com/jhollinger/grape-activerecord'

  gem.authors = ['Jordan Hollinger']
  gem.email = 'jordan.hollinger@gmail.com'

  gem.license = 'MIT'

  gem.files = Dir['lib/**/**'] + ['README.rdoc', 'LICENSE']

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_dependency 'grape', '~> 0.1'
  gem.add_dependency 'activerecord', '~> 4.0'
  gem.add_dependency 'hashie-forbidden_attributes', '~> 0.1.1'
end
