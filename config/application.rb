require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WaypointGpsApi
  class Application < Rails::Application

    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.api_only = true

    # Agregar middleware para Sidekiq::Web
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_waypoint_gps_api_session'

    config.active_job.queue_adapter = :sidekiq
  end
end



