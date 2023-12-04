# frozen_string_literal: true

require_relative 'command_base'

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # CommandLightTextV14 is a subclass of Base. It provides functionalities specific to the Cohere
      # Command Light model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=cohere.command-light-text-v14
      # for more information about the Cohere model.
      class CommandLightTextV14 < CommandBase
        # Returns the model ID for the Cohere Command Light model.
        #
        # @return [String] 'cohere.command-light-text-v14'
        def model_id
          'cohere.command-light-text-v14'
        end
      end
    end
  end
end
