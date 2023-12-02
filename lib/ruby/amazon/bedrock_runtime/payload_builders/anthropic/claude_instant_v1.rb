# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Anthropic
      # ClaudeInstantV1 is a subclass of Base. It provides functionalities specific to the Anthropic
      # Claude Instant 1.2 model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=anthropic.claude-instant-v1
      # for more information about the Anthropic model.
      class ClaudeInstantV1 < Base
        # Returns the model ID for the Anthropic Claude Instant 1.2 model.
        #
        # @return [String] 'amazon.titan-text-express-v1'
        def model_id
          'anthropic.claude-instant-v1'
        end
      end
    end
  end
end
