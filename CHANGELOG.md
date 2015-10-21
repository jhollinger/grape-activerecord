### 1.1.1 (2015-10-21)
* Bugfix to detecting RACK_ENV in Rakefiles

### 1.1.0 (2015-10-16)
* Add options to customize location of migration files, seeds file, etc.

### 1.0.3  (2015-08-28)
* Bugfix to `Grape::ActiveRecord.database_url` - [PR #5](https://github.com/jhollinger/grape-activerecord/pull/5) - [rngtng](https://github.com/rngtng)

### 1.0.2 (2015-08-14)
* Bugfixes to loading db config in Rakefile

### 1.0.1 (2015-08-10)
* Make Rakefile easier to configure with custom db location
* README updates
* Example app updates

### 1.0.0 (2015-08-01)
* Fixes to support grape 0.12+
* Remove need to use Grape::ActiveRecord::Extension - set up ActiveRecord connections immediately using sane default

### 0.0.8
* Automatically pull in the hashie-forbidden_attributes gem, which fixes some conflicts between Hashie (used by Grape) and ActiveRecord

### 0.0.6
* Bugfix to rake tasks

### 0.0.5
* Force RACK_ENV=test on rake db:test:prepare

### 0.0.4
* Bugfix to db:create_migration rake task

### 0.0.3
* Cleaner ActiveRecord Rake task integration

### 0.0.2
* Bugfix: Unhandled exceptions were leaking ActiveRecord connections
* Use ::ActiveRecord::ConnectionAdapters::ConnectionManagement middleware instead of duplicating it

### 0.0.1
* Initial release
