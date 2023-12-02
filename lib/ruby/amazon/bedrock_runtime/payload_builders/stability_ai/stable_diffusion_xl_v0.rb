# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module StabilityAi
      # StableDifussionXlV0 is a subclass of Base. It provides functionalities specific to the Stability AI
      # SDXL 0.8 model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=stability.stable-diffusion-xl-v0
      # for more information about the Anthropic model.
      class StableDiffusionXlV0 < Base
        # Returns the model ID for the SDXL 0.8 model.
        #
        # @return [String] 'stability.stable-diffusion-xl-v0'
        def model_id
          'stability.stable-diffusion-xl-v0'
        end
      end
    end
  end
end
