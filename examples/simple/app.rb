RACK_ENV = (ENV['RACK_ENV'] || 'development').to_sym
require 'bundler'
Bundler.require(:default, RACK_ENV)

class App < Grape::API
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

Grape::ActiveRecord.database_file = 'db/config.yml'
Widget = Class.new(ActiveRecord::Base)
