# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Amazon
      # TitanTextLiteV1 is a subclass of Base. It provides functionalities specific to the Amazon
      # Titan Text G1 - Lite model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=amazon.titan-text-lite-v1
      # for more information about the Amazon model.
      class TitanTextLiteV1 < Base
        def build
          {
            model_id: 'amazon.titan-text-lite-v1',
            body: {
              inputText: @input,
              textGenerationConfig: {
                maxTokenCount: 4096,
                stopSequences: [],
                temperature: 0,
                topP: 1
              }
            }.to_json
          }
        end
      end
    end
  end
end
