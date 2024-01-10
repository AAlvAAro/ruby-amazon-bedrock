# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # Builds and returns a payload hash suitable for the Cohere command model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class EmbedBase < RubyAmazonBedrock::PayloadBuilders::Base
        # Builds and returns a payload suitable for text embedding or search tasks.
        # The method configures the necessary payload structure for processing text input,
        # specifically for embedding or indexing in an AI-driven search system.
        #
        # @return [Hash] A hash representing the structured payload for text embedding or search:
        #   - :model_id [String] Identifier of the AI model that will process the embedding or search task.
        #   - :content_type [String] Specifies the content type of the payload, typically 'application/json'.
        #   - :accept [String] Indicates the MIME type the response should conform to.
        #   - :body [String] A JSON string that includes the following:
        #     - :texts [Array<String>] The text(s) to be processed, either a single string or an array of strings.
        #     - :input_type [String] Specifies the nature of the input, set to 'search_document' for search tasks.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              texts: [@prompt],
              input_type: parameters[:input_type],
              truncate: parameters[:truncate]
            }.to_json
          }
        end

        def model_id
          # noop
        end

        def parameters
          {
            input_type: @options[:input_type] || 'search_document',
            truncate: @options[:truncate] || 'NONE'
          }
        end
      end
    end
  end
end
