# frozen_string_literal: true

require_relative 'base'

module RubyAmazonBedrock
  module PayloadBuilders
    module Ai21Labs
      # J2MidV1 is a subclass of Base. It provides functionalities specific to the AI21 Labs Jurassic-2 Mid model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=ai21.j2-mid-v1
      # for more information about the AI21 Labs model.
      class J2MidV1 < Base
        # Returns the model ID for the AI21 Labs Jurassic-2 Mid model.
        #
        # @return [String] 'ai21labs.j2-mid-v1'
        def model_id
          'ai21labs.j2-mid-v1'
        end
      end
    end
  end
end
