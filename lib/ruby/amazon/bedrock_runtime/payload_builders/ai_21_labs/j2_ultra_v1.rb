# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Ai21Labs
      # J2UltraV1 is a subclass of Base. It provides functionalities specific to the AI21 Labs Jurassic-2 Ultra model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=ai21.j2-ultra-v1
      # for more information about the AI21 Labs model.
      class J2UltraV1 < Base
        # Returns the model ID for the AI21 Labs Jurassic-2 Ultra model.
        #
        # @return [String] 'ai21labs.j2-ultra-v1'
        def model_id
          'ai21labs.j2-ultra-v1'
        end
      end
    end
  end
end
