# frozen_string_literal: true

class ApplicationService
  def initialize(**args)
    @args = args
  def call
    raise NotImplementedError, "Subclasses must implement the #call method"
  end

  private


  def failure(message)
    Servicely::Result.failure(message)
  end
end
