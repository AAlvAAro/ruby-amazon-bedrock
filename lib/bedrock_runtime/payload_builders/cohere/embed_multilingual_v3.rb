# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # EmbedMultilingualV3 is a subclass of Base. It provides functionalities specific to the Cohere
      # Embed Multilingual model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=cohere.embed-multilingual-v3
      # for more information about the Cohere model.
      class EmbedMultilingualV3 < EmbedBase
        # Returns the model ID for the Cohere Embed Multilingual model.
        #
        # @return [String] 'cohere.embed-multilingual-v3'
        def model_id
          'cohere.embed-multilingual-v3'
        end
      end
    end
  end
end
