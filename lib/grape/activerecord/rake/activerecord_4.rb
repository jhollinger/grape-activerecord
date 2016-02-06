Rake::Task.define_task('db:_load_config') do
  ActiveRecord::Base.logger = nil

  ActiveRecord::Tasks::DatabaseTasks.tap do |config|
    config.root = Rake.application.original_dir
    config.env = Grape::ActiveRecord.rack_env.to_s
    config.db_dir = Grape::ActiveRecord.db_dir
    config.migrations_paths = Array(Grape::ActiveRecord.migrations_paths)
    config.fixtures_path = Grape::ActiveRecord.fixtures_path
    config.database_configuration = ActiveRecord::Base.configurations
    config.seed_loader = Object.new
    config.seed_loader.instance_eval do
      def load_seed
        load "#{ActiveRecord::Tasks::DatabaseTasks.db_dir}/#{Grape::ActiveRecord.seed_file}"
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
