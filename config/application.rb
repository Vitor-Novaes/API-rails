require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OneBitContacts
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.api_only = true

    # Configurações do gem rack-cors
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*' # Todos os sites podem chamar a API 
        resource '*', # Qualquer resurso pode ser chamado
          # Todos os headers
          headers: :any,
          #Todos os métodos da API podem ser chamados 
          methods: %i(get post put pacth delete options head) 
      end
    end
    
    #Gem Rack-attack
    config.middleware.use Rack::Attack

  end
end
