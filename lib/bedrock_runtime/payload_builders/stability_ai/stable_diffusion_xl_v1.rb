# frozen_string_literal: true

require_relative 'base'

module RubyAmazonBedrock
  module PayloadBuilders
    module StabilityAi
      # StableDifussionXlV1 is a subclass of Base. It provides functionalities specific to the Stability AI
      # SDXL 1.0 model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=stability.stable-diffusion-xl-v1
      # for more information about the Stability AI model.
      class StableDiffusionXlV1 < Base
        # Returns the model ID for the SDXL 1.0 model.
        #
        # @return [String] 'stability.stable-diffusion-xl-v1'
        def model_id
          'stability.stable-diffusion-xl-v1'
        end
      end
    end
  end
end
