# Grape and ActiveRecord integration
module Grape
  # Grape and ActiveRecord integration
  module ActiveRecord
    # The current Rack environment
    RACK_ENV = (ENV['RACK_ENV'] || 'development').to_sym

    # Connect to database with a Hash. Example:
    # {adapter: 'postgresql', host: 'localhost', database: 'db', username: 'user', password: 'pass', encoding: 'utf8', pool: 10, timeout: 5000}
    def self.database=(spec)
      ::ActiveRecord::Base.configurations = {RACK_ENV => spec}.stringify_keys
      ::ActiveRecord::Base.establish_connection(RACK_ENV)
    end

    # Connect to database with a DB URL. Example: "postgres://user:pass@localhost/db"
    def self.database_url=(url)
      self.database = ::ActiveRecord::ConnectionAdapters::ConnectionSpecification::ConnectionUrlResolver.new(url).to_hash
    end

    # Connect to database with a yml file. Example: "config/database.yml"
    def self.database_file=(path)
      raise "#{path} does not exist!" unless File.file? path
      ::ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read(path)).result) || {}
      ::ActiveRecord::Base.establish_connection(RACK_ENV)
    end
  end
end
