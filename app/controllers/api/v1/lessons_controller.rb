class Api::V1::LessonsController < Api::V1::ApiController
  before_action :set_api_format, :require_app_api_key
end
