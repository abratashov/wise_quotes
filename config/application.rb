require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'socky/client'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module WiseQuotes
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

    config.assets.paths << Rails.root.join("app", "assets", "templates")
    config.i18n.enforce_available_locales = true

    class HamlTemplate < Tilt::HamlTemplate
      def prepare
        @options = @options.merge :format => :html5
        super
      end
    end

    config.before_initialize do |app|
      require 'sprockets'
      Sprockets::Engines #force autoloading
      Sprockets.register_engine '.haml', HamlTemplate
    end

    def socky
      @socket = @socket || Socky::Client.new('http://localhost:3001/http/app', 'my_secret')
    end
  end
end

ActsAsTaggableOn.remove_unused_tags = true


