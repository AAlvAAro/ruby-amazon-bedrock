# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    # Base class serves as an abstract class for payload builders.
    # It provides the basic structure and enforces the implementation
    # of certain methods in derived classes.
    class Base
      # Initializes a new instance of the Base class.
      # @param input [String] The input string for what needs to be generated.
      # @param options [Hash] optional parameters to customize payload building.
      # @option options [Any] :key Custom option key-value pairs.
      def initialize(input, options = {})
        @input = input
        @options = options
      end

      # Abstract method to build the payload.
      # @raise [NotImplementedError] if the subclass does not implement this method.
      # @return [Hash] the constructed payload.
      def build
        raise NotImplementedError
      end

      # Abstract method to retrieve the model ID.
      # @raise [NotImplementedError] if the subclass does not implement this method.
      # @return [String] the Amazon Bedrock model ID.
      def model_id
        raise NotImplementedError
      end
    end
  end
end
