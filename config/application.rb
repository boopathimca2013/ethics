require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ethics
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.secret_key_base = "7ce3d459cb986df088df589a2f88d678e3768ad1f4b95d8ded919facd1ce6c75c443a63e5a2d5c9e81740404f1bae2badd89cc3fade37b690e29ab6edaf23941"
  end
end
