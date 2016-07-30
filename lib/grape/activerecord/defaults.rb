Grape::ActiveRecord.db_dir = 'db'
Grape::ActiveRecord.migrations_paths = %w(db/migrate)
Grape::ActiveRecord.fixtures_path = 'test/fixtures'
Grape::ActiveRecord.seed_file = 'seeds.rb'
Grape::ActiveRecord._normalizer = case ::ActiveRecord::VERSION::MAJOR
                                  when 4 then Grape::ActiveRecord::Compatibility4.new
                                  end
