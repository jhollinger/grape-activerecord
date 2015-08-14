load "active_record/railties/databases.rake"
require "grape/activerecord/rake/activerecord_#{ActiveRecord::VERSION::MAJOR}"
load "grape/activerecord/tasks.rake"
