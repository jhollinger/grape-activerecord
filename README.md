# grape-activerecord

A simple way to use ActiveRecord with your Grape apps. The defaults are all very Railsy (`config/database.yml`, `db/seeds.rb`, `db/migrate`, etc.), but you can easily change them.

## How to use

#### 1. Add it to your Gemfile

    gem "grape-activerecord"

#### 2. Configure your database connection

After loading your gems, tell `Grape::ActiveRecord` about your database config using one of the following examples:

    Grape::ActiveRecord.configure_from_file! "config/database.yml"
    Grape::ActiveRecord.configure_from_url! ENV['DATABASE_URL'] # e.g. postgres://user:pass@host/db
    Grape::ActiveRecord.configure_from_hash! {adapter: "postgresql", host: "localhost", database: "db", username: "user", password: "pass", encoding: "utf8", pool: 10, timeout: 5000}

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

Look under /example for an example app.

## Advanced options

The defaults for db-related files like migrations, seeds, and fixtures are the same as Rails. If you want to override them, use the following options:

    Grape::ActiveRecord.db_dir = 'db'
    Grape::ActiveRecord.migrations_paths = ['db/migrate']
    Grape::ActiveRecord.fixtures_path = 'test/fixtures'
    Grape::ActiveRecord.seed_file = 'seeds.rb'

## License

Licensed under the MIT License

Copyright 2014 Jordan Hollinger
