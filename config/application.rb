require_relative 'boot'

require 'rails/all'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Minions
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    creds_file = File.join(Rails.root, 'config', 'secrets.json')
    creds = JSON.load(File.read(creds_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(creds_file)

    # If file format is yml
    creds = YAML.load(File.read(creds_file)).each do |key, value|
      ENV[key.to_s] = value
    end if File.exists?(creds_file)

  end
end
