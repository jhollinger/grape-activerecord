class ApiApp < Grape::API
  include Grape::ActiveRecord::Extension
  mount ApiV1
end
