# frozen_string_literal: true

require_relative '../base'

module RubyAmazonBedrock
  module PayloadBuilders
    module Ai21Labs
      # Builds and returns a payload hash suitable for the AI21Labs model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class Base < RubyAmazonBedrock::PayloadBuilders::Base
        # Builds and returns a hash representing the payload.
        # The method prepares the data necessary for processing by an unspecified model.
        # This includes setting various parameters such as content type, model id, and
        # specific attributes related to the prompt and its processing characteristics.
        #
        # @return [Hash] A hash containing various keys and values required to process the prompt:
        #   - :model_id [String] The ID of the model to which the payload is intended.
        #   - :content_type [String] The content type of the payload, typically 'application/json'.
        #   - :accept [String] Specifies the MIME type that the method response should conform to.
        #   - :body [String] A JSON string containing:
        #     - :prompt [String] The input prompt to be processed.
        #     - :maxTokens [Integer] The maximum number of tokens to generate.
        #     - :temperature [Integer] Controls randomness in the response generation.
        #     - :topP [Integer] Controls the diversity of the generated text.
        #     - :stop_sequences [Array] An array of strings which, when encountered, will end generation.
        #     - :countPenalty, :presencePenalty, :frequencyPenalty [Hash] Hashes containing a scale key
        # 			used for penalty configuration.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              prompt: @input,
              maxTokens: 200,
              temperature: 0,
              topP: 250,
              stop_sequences: [],
              countPenalty: { scale: 0 },
              presencePenalty: { scale: 0 },
              frequencyPenalty: { scale: 0 }
            }.to_json
          }
        end

        def model_id
          # noop
        end
      end
    end
  end
end
