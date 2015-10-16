::ActiveRecord::Base.default_timezone = :utc
::ActiveRecord::Base.logger = Logger.new(STDOUT)

if ENV['DATABASE_URL']
  Grape::ActiveRecord.database_url = ENV['DATABASE_URL']
elsif File.file? 'config/database.yml'
  Grape::ActiveRecord.database_file = 'config/database.yml'
end

Grape::ActiveRecord.db_dir = 'db'
Grape::ActiveRecord.migrations_paths = %w(db/migrate)
Grape::ActiveRecord.fixtures_path = 'test/fixtures'
Grape::ActiveRecord.seed_file = 'seeds.rb'
