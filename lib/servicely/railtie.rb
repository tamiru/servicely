# frozen_string_literal: true

require "rails/railtie"

module Servicely
  class Railtie < Rails::Railtie
    # Auto-load `app/services`
    initializer "servicely.autoload_services" do |app|
      services_path = Rails.root.join("app/services").to_s
      ActiveSupport::Dependencies.autoload_paths << services_path
      app.config.eager_load_paths << services_path
    end

    # Add generator to Rails
    generators do
      require "servicely/generators/servicely_generator"
    end
  end
end
