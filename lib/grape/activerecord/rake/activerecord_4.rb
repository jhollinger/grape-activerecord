Rake::Task.define_task('db:_load_config') do
  require 'grape/activerecord'
  ActiveRecord::Base.logger = nil

  ActiveRecord::Tasks::DatabaseTasks.tap do |config|
    config.root = Rake.application.original_dir
    config.env = Grape::ActiveRecord::RACK_ENV.to_s
    config.db_dir = 'db'
    config.migrations_paths = ['db/migrate']
    config.fixtures_path = 'test/fixtures'
    config.database_configuration = ActiveRecord::Base.configurations
    config.seed_loader = Object.new
    config.seed_loader.instance_eval do
      def load_seed
        load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/seeds.rb"
      end
    end
  end
end

Rake::Task['db:load_config'].clear
Rake::Task.define_task('db:load_config') do
  # Run the user's db:environment task first, so they have an opportunity to set a custom db config location
  Rake::Task['db:environment'].invoke
end

Rake::Task.define_task('db:environment') do
  # defined by user
end

# Load db config at the end of user-defined db:environment
Rake::Task['db:environment'].enhance do
  Rake::Task['db:_load_config'].invoke
end

Rake::Task['db:test:deprecated'].clear if Rake::Task.task_defined?('db:test:deprecated')
