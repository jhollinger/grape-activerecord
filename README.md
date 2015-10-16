# grape-activerecord

A simple way to use ActiveRecord with your Grape apps. The defaults are all very Railsy (`config/database.yml`, `db/seeds.rb`, `db/migrate`, etc.), but you can easily change them.

## How to use

#### 1. Add it to your Gemfile

    gem "grape-activerecord"

#### 2. Configure your database connection

By default grape-activerecord looks for your database configuration in:

* `config/database.yml` (see /examples for a sample file)
* The `DATABASE_URL` environment variable (e.g. `postgres://user:pass@host/db`)

#### 3. Enable ActiveRecord connection management

This ActiveRecord middleware cleans up your database connections after each request. Add it to your `config.ru` file:

    use ActiveRecord::ConnectionAdapters::ConnectionManagement

#### 4. Import ActiveRecord tasks into your Rakefile

This will give you most of the standard `db:` tasks you get in Rails. Add it to your `Rakefile`.

    require "bundler/setup"
    require "grape/activerecord/rake"

    namespace :db do
      # Some db tasks require your app code to be loaded, or at least your gems
      task :environment do
        require_relative "app"
      end
    end

Unlike in Rails, creating a new migration is also a rake task. Run `bundle exec rake -T` to get a full list.

    bundle exec rake db:create_migration NAME=create_widgets

## Examples

Look under /examples for some example apps.

## Advanced options

You have a number of ways to tell ActiveRecord about your database. Use these options early in your app's boot process: somewhere between bundler and your app code. And make sure they make it into your `Rakefile` (maybe in `require_relative "app"` above.)

    Grape::ActiveRecord.database_file = "elsewhere/db.yml"
    Grape::ActiveRecord.database_url = "postgres://user:pass@host/db"
    Grape::ActiveRecord.database = {adapter: "postgresql", host: "localhost", database: "db", username: "user", password: "pass", encoding: "utf8", pool: 10, timeout: 5000}

You can configure custom locations for your db-related files like migrations, seeds, and fixtures. You should probably put these near the top of your `Rakefile`, before defining your tasks.

    Grape::ActiveRecord.db_dir = 'db'
    Grape::ActiveRecord.migrations_paths = ['db/migrate']
    Grape::ActiveRecord.fixtures_path = 'test/fixtures'
    Grape::ActiveRecord.seed_file = 'seeds.rb'

## License

Licensed under the MIT License

Copyright 2014 Jordan Hollinger
