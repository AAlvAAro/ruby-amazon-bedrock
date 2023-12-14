# frozen_string_literal: true

require_relative 'response_builders/image'
require_relative 'response_builders/text'

module RubyAmazonBedrock
  # The ResponseFactory class is a factory for creating different types of response builder objects.
  # It is designed to instantiate and return either a Text or Image response builder based on the type specified.
  class ResponseFactory
    # Initializes a new instance of the ResponseFactory class.
    #
    # @param type [Symbol] The type of response builder to create (:text or :image).
    # @param response [Object] The raw response object, typically an HTTP response.
    # @param optios [Hash] Additional options for the response builder.
    def initialize(type, response, options = {})
      @type = type
      @response = response
      @options = options
    end

    # Creates and returns an instance of the specified response builder.
    # This method uses the @type instance variable to determine which type of response
    # builder to instantiate and return.
    #
    # @return [ResponseBuilders::Text, ResponseBuilders::Image] Depending on the type,
    # it returns an instance of either ResponseBuilders::Text or ResponseBuilders::Image.
    # Returns nil if the type does not match any known response builders.
    def create
      case @type
      when :text
        ResponseBuilders::Text.new(@response)
      when :image
        ResponseBuilders::Image.new(@response, @options)
      end
    end
  end
end
