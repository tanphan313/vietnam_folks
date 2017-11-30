require_relative 'boot'
require 'carrierwave'
require 'carrierwave/orm/activerecord'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VietnamFolks
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    I18n.available_locales = [:en, :vi, :ko, :ru, :zh, :fr]
    config.i18n.default_locale = :vi

    CarrierWave.configure do |config|
      config.root = "#{Dir.pwd}/public/"
    end
  end
end
