::ActiveRecord::Base.default_timezone = :utc
::ActiveRecord::Base.logger = Logger.new(STDOUT)

Grape::ActiveRecord.db_dir = 'db'
Grape::ActiveRecord.migrations_paths = %w(db/migrate)
Grape::ActiveRecord.fixtures_path = 'test/fixtures'
Grape::ActiveRecord.seed_file = 'seeds.rb'
