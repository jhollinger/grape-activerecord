require './config/environment'
require './main'

use ActiveRecord::ConnectionAdapters::ConnectionManagement

map '/api' do
  run ApiApp
end
