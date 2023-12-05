# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # Builds and returns a payload hash suitable for the Cohere command model processing.
      # This method constructs a payload with specific parameters like `model_id`,
      # `content_type`, `accept`, and a `body` that includes various AI-related settings.
      #
      # @return [Hash] The constructed payload containing AI model parameters and settings.
      class CommandBase < RubyAmazonBedrock::PayloadBuilders::Base
        # Builds and returns a hash representing the payload for command generation requests.
        # This method prepares the data necessary for processing a command input through
        # a specified AI model. It configures several parameters to control the behavior
        # and output of the model in response to the command.
        #
        # @return [Hash] A hash containing the necessary information for command processing:
        #   - :model_id [String] The identifier for the model that will process the command.
        #   - :content_type [String] Specifies the content type of the payload, set to 'application/json'.
        #   - :accept [String] Indicates the MIME type that the response should conform to.
        #   - :body [String] A JSON string that includes the following details:
        #     - :prompt [String] The command input to be processed by the model.
        #     - :maxTokens [Integer] The maximum number of tokens the model should generate in response.
        #     - :temperature [Float] A parameter controlling the variability in the model's responses.
        #     - :return_likelihood [String] Indicates whether the response should include likelihood information.
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: '*/*',
            body: {
              prompt: "#{@input}:",
              max_tokens: 100,
              temperature: 0.8
              # return_likelihood: 'GENERATION' NOTE: This was since it was giving an error
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
