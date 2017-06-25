class Api::V1::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!

  APP_API_KEY = 'Pr4BP2BedViT6Gjm2aiwRJAy6ziTs2i6yGrsyTp9'.freeze

  def set_api_format
    request.format = :json if request.format == :html
  end

  def require_app_api_key
    unless request.headers['HTTP_APP_API_KEY'] == APP_API_KEY
      api_response({ errors: { message: 'failed to authorization' } }, 401)
    end
  end

  def api_response(response, status = nil, format = :json)
    render(format => response, status: status)
  end
end
