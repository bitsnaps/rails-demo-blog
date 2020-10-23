require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DemoBlog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Add directories to autoload_paths (need to restart rails server)
    config.autoload_paths << "#{Rails.root}/app/models/validators"

    # Disable helper creation with controller
    config.generators.helper = false

    # Disable assets creation with controller
    config.generators.assets = false

    # Serve images/assets from CDN (you can put this line in production config)
    # config.action_controller.asset_host = 'cdn.mydomainname.com'

    # Default mailer host (can be customized for prod/dev environment)
    # config.action_mailer.default_url_options = { host: 'example.com' }

  end
end
