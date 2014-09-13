require "pathname"
require "fileutils"
require "active_support/core_ext/string/strip"

namespace :db do
  desc "Create a migration (parameters: NAME, VERSION)"
  task :create_migration do
    unless ENV["NAME"]
      puts "No NAME specified. Example usage: `rake db:create_migration NAME=create_widgets`"
      exit 1
    end

    name = ENV["NAME"]
    version = ENV["VERSION"] || Time.now.utc.strftime("%Y%m%d%H%M%S")

    ActiveRecord::Migrator.migrations_paths.each do |directory|
      next unless File.exists?(directory)
      migration_files = Pathname(directory).children
      if duplicate = migration_files.find { |path| path.basename.to_s.include?(name) }
        puts "Another migration is already named \"#{name}\": #{duplicate}."
        exit 1
      end
    end

    filename = "#{version}_#{name}.rb"
    dirname = ActiveRecord::Migrator.migrations_path
    path = File.join(dirname, filename)

    FileUtils.mkdir_p(dirname)
    File.write path, <<-MIGRATION.strip_heredoc
      class #{name.camelize} < ActiveRecord::Migration
        def change
        end
      end
    MIGRATION

    puts path
  end
end
