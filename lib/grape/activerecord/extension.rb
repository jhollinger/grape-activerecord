module Grape
  module ActiveRecord
    # Including this module in your Grape app establishes the database connection and connection management
    module Extension
      # Establishes db connection and management
      def self.included(app)
        Grape::ActiveRecord.setup!
        app.before { ::ActiveRecord::Base.verify_active_connections! if ::ActiveRecord::Base.respond_to?(:verify_active_connections!) }
        app.after { ::ActiveRecord::Base.clear_active_connections! }
      end
    end
  end
end
