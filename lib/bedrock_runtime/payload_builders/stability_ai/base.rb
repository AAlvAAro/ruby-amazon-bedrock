# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module StabilityAi
      # Builds and returns a payload hash suitable for the Stability AI model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class Base < RubyAmazonBedrock::PayloadBuilders::Base
        # Constructs and returns a structured payload for processing by an AI model.
        # This method assembles data in a format suitable for tasks requiring configurable prompts,
        # such as text or image generation, with control over creativity and randomness.
        #
        # @return [Hash] A hash containing the necessary details for the AI model to process:
        #   - :model_id [String] Identifier for the AI model to which the request is directed.
        #   - :content_type [String] Specifies the content type of the payload, typically set to 'application/json'.
        #   - :accept [String] Indicates the MIME type that the response should conform to.
        #   - :body [String] A JSON string including:
        #     - :text_prompts [Array<Hash>] An array of hashes, each containing a 'text' key with a string value
        #       representing a prompt.
        #     - :cfg_scale [Integer] A parameter influencing the level of control versus freedom in content generation.
        #     - :seed [Integer] Seed value for deterministic outputs, enabling reproducibility of results.
        #     - :steps [Integer] Specifies the number of steps the model should take in generating the output.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              text_prompts: [
                { text: @prompt }
              ],
              cfg_scale: parameters[:cfg_scale],
              seed: parameters[:seed],
              steps: parameters[:steps]
            }.to_json
          }
        end

        def model_id
          # noop
        end

        def parameters
          {
            cfg_scale: @options[:cfg_scale] || 10,
            seed: @options[:seed] || 0,
            steps: @options[:steps] || 30
          }
        end

        def type
          :image
        end
      end
    end
  end
end
