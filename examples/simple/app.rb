RACK_ENV = (ENV['RACK_ENV'] || 'development').to_sym
require 'bundler'
Bundler.require(:default, RACK_ENV)

class App < Grape::API
  Grape::ActiveRecord.database = {adapter: 'sqlite3', database: "db/#{RACK_ENV}.sqlite3"}
  include Grape::ActiveRecord::Extension

  version 'v1', using: :path
  format :json

  desc "Get a list of Widgets"
  get :widgets do
    {
      widgets: Widget.all.map { |widget| {
        id: widget.id,
        name: widget.name
      }}
    }
  end
end

Widget = Class.new(ActiveRecord::Base)
