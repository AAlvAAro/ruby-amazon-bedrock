# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Meta
      # Builds and returns a payload hash suitable for the Meta model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class Base < RubyAmazonBedrock::PayloadBuilders::Base
        # Constructs and returns a payload formatted for text generation requests.
        # This method assembles the necessary data structure for processing text input through
        # an AI model, with various parameters to guide the generation process.
        #
        # @return [Hash] A structured payload containing:
        #   - :model_id [String] Identifier for the AI model that will process the text generation request.
        #   - :content_type [String] Specifies the content type of the payload, set to 'application/json'.
        #   - :accept [String] Indicates the MIME type for the expected response.
        #   - :body [String] A JSON string encapsulating the following details:
        #     - :prompt [String] The input text for the model to generate content from.
        #     - :max_gen_len [Integer] Maximum length for the generated content, measured in tokens.
        #     - :temperature [Float] A parameter controlling the randomness in the generated content.
        #     - :top_p [Float] Nucleus sampling parameter controlling the diversity of the generated text.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              prompt: @input,
              max_gen_len: 512,
              temperature: 0.2,
              top_p: 0.9
            }.to_json
          }
        end
      end
    end
  end
end
