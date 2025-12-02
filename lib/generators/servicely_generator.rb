require "rails/generators"

module Servicely
  module Generators
    class ServicelyGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def create_service_file
        template "service.rb.tt",
                 File.join(service_root, class_path, "#{file_name}_service.rb")
      end

      private

      # Detect app vs engine context
      def service_root
        if inside_engine?
          File.join(engine_root, "app/services")
        else
          "app/services"
        end
      end

      def inside_engine?
        # If application class is an Engine, not Application
        Rails.application.class < Rails::Engine &&
          !(Rails.application.class < Rails::Application)
      end

      def engine_root
        Rails.application.root
      end
    end
  end
end
