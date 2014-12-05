Rake::Task['db:load_config'].clear
Rake::Task.define_task('db:load_config') do
  require 'grape/activerecord'
  Grape::ActiveRecord.setup!
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

Rake::Task.define_task('db:environment') do
  Rake::Task['db:load_config'].invoke
end

Rake::Task['db:test:deprecated'].clear if Rake::Task.task_defined?('db:test:deprecated')
