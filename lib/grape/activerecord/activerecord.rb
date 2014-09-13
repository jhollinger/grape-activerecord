# Grape and ActiveRecord integration
module Grape
  # Grape and ActiveRecord integration
  module ActiveRecord
    class << self
      # A Hash representing the database connection
      attr_accessor :database
      # A database connection URL (default ENV['DATABASE_URL'])
      attr_accessor :database_url
      # YAML file where all database configurations are stored (default config/database.yml)
      attr_accessor :database_file
    end
    self.database_url = ENV['DATABASE_URL']
    self.database_file = 'config/database.yml'

    # The current Rack environment
    RACK_ENV = (ENV['RACK_ENV'] || 'development').to_sym

    # Read configuration and connect to the database
    def self.setup!
      ::ActiveRecord::Base.default_timezone = :utc
      ::ActiveRecord::Base.logger = Logger.new(STDOUT)

      if spec = Grape::ActiveRecord.database
        ::ActiveRecord::Base.configurations = {RACK_ENV => spec}.stringify_keys
        ::ActiveRecord::Base.establish_connection(RACK_ENV)

      elsif spec = Grape::ActiveRecord.database_url
        ::ActiveRecord::Base.establish_connection(spec)
        ::ActiveRecord::Base.configurations = {RACK_ENV.to_s => ::ActiveRecord::Base.connection.pool.spec.config}

      elsif path = Grape::ActiveRecord::database_file
        raise "#{path} does not exist!" unless File.file? path
        ::ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read(path)).result) || {}
        ::ActiveRecord::Base.establish_connection(RACK_ENV)

      else
        raise RuntimeError, 'You must configure a database connection!'
      end
    end
  end
end
