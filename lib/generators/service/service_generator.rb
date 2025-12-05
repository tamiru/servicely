# frozen_string_literal: true

require "rails/generators/named_base"

class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  argument :actions, type: :array, default: [], banner: "action1 action2"

  class_option :result,     type: :boolean, default: false
  class_option :interactor, type: :boolean, default: false
  class_option :scope, type: :string,  default: nil

  def create_files
    create_application_service
    create_service_file
    create_test_file
  end

  private

  def create_application_service
    path = "app/services/application_service.rb"
    template "application_service.rb.tt", path unless File.exist?(path)
  end

  def create_service_file
    parse_name
    template template_name, service_path
  end

  def create_test_file
    parse_name
    template test_template_name, test_path
  end

  def parse_name
    parts = name.underscore.split("/")

    @action_name = parts.pop.sub(/_service\z/, "")
    @file_name   = @action_name
    @class_name  = @action_name.classify

    if options[:scope]
      @namespace_parts = options[:scope].split("/")
    elsif parts.any?
      @namespace_parts = parts
    else
      @namespace_parts = infer_namespace
    end

    @service_dir     = @namespace_parts.join("/")
    @module_nesting  = @namespace_parts.map(&:classify).join("::")
  end

  def infer_namespace
    if @action_name.match(/\A(create|update|destroy|new|edit|show)_(.+)/)
      [$2.pluralize]
    else
      [@action_name.gsub(/_service\z/, "").pluralize]
    end
  end

  def template_name
    if options.interactor?
      "interactor_style.rb.tt"
    elsif options.result?
      "service_with_result.rb.tt"
    else
      "application_service_child.rb.tt"
    end
  end

  def test_template_name
    defined?(RSpec) ? "service_spec.rb.tt" : "service_test.rb.tt"
  end

  def service_path
    File.join("app/services", @service_dir, "#{@file_name}_service.rb")
  end

  def test_path
    base = defined?(RSpec) ? "spec/services" : "test/services"
    File.join(base, @service_dir, "#{@file_name}_service_#{defined?(RSpec) ? 'spec' : 'test'}.rb")
  end

  def service_actions
    actions.presence || ["call"]
  end
end