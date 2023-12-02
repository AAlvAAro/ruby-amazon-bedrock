# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Anthropic
      # ClaudeV1 is a subclass of Base. It provides functionalities specific to the Anthropic
      # Claude 1.3 model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=anthropic.claude-v1
      # for more information about the Anthropic model.
      class ClaudeV1 < Base
        # Returns the model ID for the Anthropic Claude 1.3 model.
        #
        # @return [String] 'anthropic.claude-v1'
        def model_id
          'anthropic.claude-v1'
        end
      end
    end
  end
end
