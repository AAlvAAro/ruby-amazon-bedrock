# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Amazon
      # TitanTextExpressV1 is a subclass of Base. It provides functionalities specific to the Amazon
      # Titan Text G1 - Express  model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=amazon.titan-text-express-v1
      # for more information about the Amazon model.
      class TitanTextExpressV1 < Base
        # Returns the model ID for the Amazon Titan Text G1 - Express model.
        #
        # @return [String] 'amazon.titan-text-express-v1'
        def model_id
          'amazon.titan-text-express-v1'
        end
      end
    end
  end
end
