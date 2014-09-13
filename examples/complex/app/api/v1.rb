class ApiV1 < Grape::API
  version 'v1', using: :path
  format :json
  helpers V1Helpers

  desc "Get a list of Widgets"
  get :widgets do
    widgets_response Widget.all
  end
end
