module Grape
  module ActiveRecord
    # Including this module in your Grape app establishes the database connection and handles connection management
    module Extension
      # Establishes db connection and management
      def self.included(app)
        Grape::ActiveRecord.setup!
        app.use ::ActiveRecord::ConnectionAdapters::ConnectionManagement
      end
    end
  end
end
