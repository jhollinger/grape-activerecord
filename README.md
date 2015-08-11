# grape-activerecord

A simple way to use ActiveRecord with your Grape apps.

## How to use

### 1. Add it to your Gemfile

    gem "grape-activerecord"

### 2. Configure your database connection

grape-activerecord looks for your database configuration in:

* `config/database.yml` (see /examples for a sample file)
* The `DATABASE_URL` environment variable (e.g. `postgres://user:pass@host/db`)

But if your app has more particular needs, we've got you covered:

    Grape::ActiveRecord.database_file = "elsewhere/db.yml"
    Grape::ActiveRecord.database_url = "postgres://user:pass@host/db"
    Grape::ActiveRecord.database = {adapter: "postgresql", host: "localhost", database: "db", username: "user", password: "pass", encoding: "utf8", pool: 10, timeout: 5000}

### 3. Enable ActiveRecord connection management

This ActiveRecord middleware cleans up your database connections after each request. Add it to your config.ru file:

    use ActiveRecord::ConnectionAdapters::ConnectionManagement

### 4. Import ActiveRecord tasks into your Rakefile

This will give you most of the standard `db:` tasks you get in Rails. Run `bundle exec rake -T` to get a full list.

    require "bundler/setup"
    require "grape/activerecord/rake"

    # NOTE If you set a custom db config in your app, you'll need to set it in your Rakefile too
    # Grape::ActiveRecord.database_file = "elsewhere/db.yml"

    namespace :db do
      # Some db tasks require your app code to be loaded
      task :environment do
        require_relative "app"
      end
    end

Unlike in Rails, creating a new migration is also a rake task:

    bundle exec rake db:create_migration NAME=create_widgets

## Examples

Look under /examples for some example apps.

## License

Licensed under the MIT License

Copyright 2014 Jordan Hollinger
