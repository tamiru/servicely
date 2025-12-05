# frozen_string_literal: true

module Servicely
  class Result
    attr_reader :data, :error

    def initialize(success:, data: nil, error: nil)
      @success = success
      @data = data
      @error = error
    end

    def success? = @success
    def failure? = !@success

    def self.success(data = nil)
      new(success: true, data: data)
    end

    def self.failure(error)
      new(success: false, error: error)
    end
  end
end
