# frozen_string_literal: true

require_relative 'base'

module RubyAmazonBedrock
  module PayloadBuilders
    module Amazon
      # TitanTextLiteV1 is a subclass of Base. It provides functionalities specific to the Amazon
      # Titan Text G1 - Lite model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=amazon.titan-text-lite-v1
      # for more information about the Amazon model.
      class TitanTextLiteV1 < Base
        # Returns the model ID for the Amazon Titan Text G1 - Lite model.
        #
        # @return [String] 'amazon.titan-text-lite-v1'
        def model_id
          'amazon.titan-text-lite-v1'
        end
      end
    end
  end
end
