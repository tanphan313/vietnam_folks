class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_locale

  rescue_from CanCan::AccessDenied do
    redirect_to no_role_url, alert: "AccessDenied"
  end

  private
  def current_locale
    params[:locale].presence || I18n.locale
  end

  def language_id
    M::Language.find_by(name: current_locale.to_s.upcase).id
  end

  def set_locale
    I18n.locale = if params[:locale]
      params[:locale]
    else
      I18n.default_locale
    end
  end
end
