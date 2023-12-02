# frozen_string_literal: true

module RubyAmazonBedrock
  module PayloadBuilders
    module Meta
      # Llama213bChatV1 is a subclass of Base. It provides functionalities specific to the Meta
      # Llama 2 Chat 13B model.
      #
      # @see https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=meta.llama2-13b-chat-v1
      # for more information about the Meta model.
      class Llama213bChatV1 < Base
        # Returns the model ID for the Meta Llama 2 Chat 13B model.
        #
        # @return [String] 'meta.llama2-13b-chat-v1'
        def model_id
          'meta.llama2-13b-chat-v1'
        end
      end
    end
  end
end
