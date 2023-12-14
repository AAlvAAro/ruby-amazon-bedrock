# frozen_string_literal: true

module RubyAmazonBedrock
  module ResponseBuilders
    # The Text class is responsible for parsing and building a structured response from a raw text response.
    # It converts the HTTP response into a structured format to make it easier to access the data.
    class Text
      # Initializes a new instance of the Text class.
      #
      # @param response [Object] The raw response object with is an HTTP response.
      def initialize(response)
        @response = response
      end

      # Builds and returns a structured representation of the raw text response.
      # This method parses the raw response body as JSON and symbolizes the names
      # for easier access in Ruby.
      #
      # @return [Hash] A hash representing the structured data from the response body.
      # The keys of the hash are symbolized for convenient access.
      def build
        JSON.parse(@response.body.read, symbolize_names: true)
      end
    end
  end
end
