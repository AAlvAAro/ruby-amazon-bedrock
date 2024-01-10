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
      def initialize(prompt, options = {})
        @prompt = prompt
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

      # Abstract method to set the model parameters to be sent in the request.
      # @raise [NotImplementedError] if the subclass does not implement this method.
      # @return [Hash] the Amazon Bedrock model configuration parameters.
      def parameters
        raise NotImplementedError
      end

      # Abstract method to retrieve the model type.
      # @return [Symbol] the model result type: :text (default) or :image.
      def type
        :text
      end
    end
  end
end
