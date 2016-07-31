# encoding: utf-8

require File.expand_path('../lib/grape/activerecord/version.rb', __FILE__)
Gem::Specification.new do |gem|
  gem.name = 'grape-activerecord'
  gem.version = Grape::ActiveRecord::VERSION
  gem.date = '2016-08-01'

  gem.description = 'Extends Grape with simple ActiveRecord integration. MOVED TO otr-activerecord.'
  gem.summary = 'ActiveRecord integration for Grape. MOVED TO otr-activerecord.'
  gem.homepage = 'https://github.com/jhollinger/grape-activerecord'

  gem.authors = ['Jordan Hollinger']
  gem.email = 'jordan.hollinger@gmail.com'

  gem.license = 'MIT'

  gem.files = Dir['lib/**/**'] + ['README.md', 'LICENSE']

  gem.required_ruby_version = '>= 2.1.0'

  gem.add_runtime_dependency 'otr-activerecord', '~> 1.0'

  gem.post_install_message = <<-STR
#
# DEPRECATION WARNING
# 'grape-activerecord' has been deprecated; 'otr-activerecord' has been installed instead.
# Please refer to the documentation for 'otr-activerecord' available at https://github.com/jhollinger/otr-activerecord
# Don't worry; it's nearly identical.
#
  STR
end
