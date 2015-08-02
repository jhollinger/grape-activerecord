::ActiveRecord::Base.default_timezone = :utc
::ActiveRecord::Base.logger = Logger.new(STDOUT)

if ENV['DATABASE_URL']
  Grape::ActiveRecord.database_url = ENV['DATABASE_URL']
elsif File.file? 'config/database.yml'
  Grape::ActiveRecord.database_file = 'config/database.yml'
end
