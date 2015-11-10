# Grape and ActiveRecord integration
module Grape
  # Grape and ActiveRecord integration
  module ActiveRecord
    class << self
      # Relative path to the "db" dir
      attr_accessor :db_dir
      # Relative path(s) to the migrations directory
      attr_accessor :migrations_paths
      # Relative path to the fixtures directory
      attr_accessor :fixtures_path
      # Name of the seeds file in db_dir
      attr_accessor :seed_file
    end

    # Connect to database with a Hash. Example:
    # {adapter: 'postgresql', host: 'localhost', database: 'db', username: 'user', password: 'pass', encoding: 'utf8', pool: 10, timeout: 5000}
    def self.database=(spec)
      ::ActiveRecord::Base.configurations = {rack_env => spec}.stringify_keys
      ::ActiveRecord::Base.establish_connection(rack_env)
    end

    # Connect to database with a DB URL. Example: "postgres://user:pass@localhost/db"
    def self.database_url=(url)
      self.database = ::ActiveRecord::ConnectionAdapters::ConnectionSpecification::ConnectionUrlResolver.new(url).to_hash
    end

    # Connect to database with a yml file. Example: "config/database.yml"
    def self.database_file=(path)
      raise "#{path} does not exist!" unless File.file? path
      ::ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read(path)).result) || {}
      ::ActiveRecord::Base.establish_connection(rack_env)
    end

    # The current Rack environment
    def self.rack_env
      (ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development').to_sym
    end
  end
end
