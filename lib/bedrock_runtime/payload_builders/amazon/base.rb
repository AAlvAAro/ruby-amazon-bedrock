# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Amazon
      # Builds and returns a payload hash suitable for the Amazon model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class Base < RubyAmazonBedrock::PayloadBuilders::Base
        # Builds and returns a hash representing the payload for a text generation request.
        # This method prepares the necessary data structure for processing an input text through
        # a specified model. It includes various configuration parameters for text generation.
        #
        # @return [Hash] The method returns a hash with the following key-value pairs:
        #   - :model_id [String] The identifier for the model that will process the request.
        #   - :content_type [String] Specifies the content type of the payload, set to 'application/json'.
        #   - :accept [String] Indicates the MIME type that the response should conform to.
        #   - :body [String] A JSON string that includes the following details:
        #     - :inputText [String] The input text to be processed by the model.
        #     - :textGenerationConfig [Hash] A hash containing configuration parameters for text generation:
        #       - :maxTokens [Integer] The maximum number of tokens to generate.
        #       - :stopSequences [Array<String>] An array of strings that, when encountered, will signal the end
        # 				of generation.
        #       - :temperature [Float] A parameter controlling the randomness in the response generation.
        #       - :topP [Float] A parameter controlling the diversity of the generated text.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              inputText: @prompt,
              textGenerationConfig: parameters
            }.to_json
          }
        end

        def model_id
          # noop
        end

        def parameters
          {
            maxTokenCount: @options[:max_tokens] || 4096,
            stopSequences: @options[:stop_sequences] || [],
            temperature: @options[:temperature] || 0,
            topP: @options[:top_p] || 1
          }
        end
      end
    end
  end
end
