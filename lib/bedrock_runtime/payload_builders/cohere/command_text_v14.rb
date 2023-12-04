# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # CommandTextV14 is a subclass of Base. It provides functionalities specific to the Cohere
      # Command model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=cohere.command-text-v14
      # for more information about the Cohere model.
      class CommandTextV14 < CommandBase
        # Returns the model ID for the Cohere Command model.
        #
        # @return [String] 'cohere.command-text-v14'
        def model_id
          'cohere.command-text-v14'
        end
      end
    end
  end
end
