# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Cohere
      # EmbedEnglishV3 is a subclass of Base. It provides functionalities specific to the Cohere
      # Embed English model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=cohere.embed-english-v3
      # for more information about the Cohere model.
      class EmbedEnglishV3 < EmbedBase
        # Returns the model ID for the Cohere Embed English model.
        #
        # @return [String] 'cohere.embed-english-v3'
        def model_id
          'cohere.embed-english-v3'
        end
      end
    end
  end
end
