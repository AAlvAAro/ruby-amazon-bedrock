# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Anthropic
      # Builds and returns a payload hash suitable for the Anthropic model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class Base < RubyAmazonBedrock::PayloadBuilders::Base
        # Constructs and returns a payload hash for text generation requests.
        # This method is designed to prepare a structured payload comprising various
        # parameters that dictate how the input text should be processed by the models.
        #
        # @return [Hash] A structured payload hash containing:
        #   - :model_id [String] Identifies the model ('anthropic.claude-2') to process the request.
        #   - :content_type [String] Defines the content type of the payload ('application/json').
        #   - :accept [String] Specifies the MIME type expected in the response.
        #   - :body [String] A JSON string including the following details:
        #     - :prompt [String] The input text for the model to process.
        #     - :max_tokens_to_sample [Integer] The maximum number of tokens the model should generate.
        #     - :temperature [Float] A parameter influencing the randomness in response generation.
        #     - :top_k [Integer] A parameter specifying the number of highest probability vocabulary tokens to keep for
        # 			top-k sampling.
        #     - :top_p [Float] Controls the diversity of the generated text (nucleus sampling).
        #     - :stop_sequences [Array<String>] An array containing specific sequences that signal the model to stop
        # 			text generation.
        #     - :anthropic_version [String] Specifies the version of the underlying model or API.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              prompt: "\n\nHuman: #{@input}\n\nAssistant:",
              max_tokens_to_sample: 300,
              temperature: 0.5,
              top_k: 250,
              top_p: 1,
              stop_sequences: [
                '\n\nHuman'
              ],
              anthropic_version: 'bedrock-2023-05-31'
            }.to_json
          }
        end
      end
    end
  end
end
