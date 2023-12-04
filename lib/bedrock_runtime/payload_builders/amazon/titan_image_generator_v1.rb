# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Amazon
      # TitanImageGeneratorV1 is a subclass of Base. It provides functionalities specific to the Amazon
      # Titan Image Generator G1 - v1 model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=amazon.titan-image-generator-v1
      # for more information about the Amazon model.
      # NOTE: This model is currently in preview release. Changes may be made to this model.
      class TitanImageGeneratorV1 < RubyAmazonBedrock::PayloadBuilders::Base
        def build
          {
            model_id: model_id,
            content_type: 'application/json',
            accept: 'application/json',
            body: {
              taskType: "TEXT_IMAGE",
              textToImageParams: {
                text: @input,
                negativeTtext: @options[:negative_text]
              },
              imageGenerationConfig: {
                numberOfImages: @options[:number_of_images] || 1,
                quality: @options[:quality] || 'standard',
                height: @options[:height] || 1024,
                width: @options[:width] || 1024,
                cfgScale: @options[:cfg_scale] || 8.0,
                seed: @options[:seed] || 0
              }
            }.to_json
          }
        end

        # Returns the model ID for the AI21 Labs Titan Image Generator G1 - v1 model.
        #
        # @return [String] 'amazon.titan-image-generator-v1'
        def model_id
          'amazon.titan-image-generator-v1'
        end
      end
    end
  end
end
