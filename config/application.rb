# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    # Определяем дефолтную версию rails
    config.load_defaults 6.1
    # Определяем часовой пояс
    config.time_zone = 'Moscow'

    # Определяем язык. Нужно еще создать файл ru.yml в конфиге системе. по аналогии с en.yml
    config.i18n.default_locale = :ru

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
