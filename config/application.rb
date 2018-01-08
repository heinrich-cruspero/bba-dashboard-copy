require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BbaDashboard
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_mailer.smtp_settings = {
        :address => "email-smtp.us-east-1.amazonaws.com",
        :port => 587,
        :user_name => ENV["SES_SMTP_USERNAME"], #Your SMTP user
        :password => ENV["SES_SMTP_PASSWORD"], #Your SMTP password
        :authentication => :login,
        :enable_starttls_auto => true
    }

    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { host: ENV['ROOT_URL'] }
  end
end
