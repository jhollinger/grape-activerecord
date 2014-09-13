require './config/environment'
require './main'

map '/api' do
  run ApiApp
end
