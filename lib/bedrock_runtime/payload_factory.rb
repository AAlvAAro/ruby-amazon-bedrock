# frozen_string_literal: true

require_relative 'payload_builders/ai_21_labs/j2_mid_v1'
require_relative 'payload_builders/ai_21_labs/j2_ultra_v1'
require_relative 'payload_builders/amazon/titan_image_generator_v1'
require_relative 'payload_builders/amazon/titan_text_lite_v1'
require_relative 'payload_builders/amazon/titan_text_express_v1'
require_relative 'payload_builders/anthropic/claude_v1'
require_relative 'payload_builders/anthropic/claude_instant_v1'
require_relative 'payload_builders/anthropic/claude_v2'
require_relative 'payload_builders/cohere/command_light_text_v14'
require_relative 'payload_builders/cohere/command_text_v14'
require_relative 'payload_builders/cohere/embed_english_v3'
require_relative 'payload_builders/cohere/embed_multilingual_v3'
require_relative 'payload_builders/meta/llama213b_chat_v1'
require_relative 'payload_builders/meta/llama270b_chat_v1'
require_relative 'payload_builders/stability_ai/stable_diffusion_xl_v0'
require_relative 'payload_builders/stability_ai/stable_diffusion_xl_v1'

module RubyAmazonBedrock
  # Raised when an unknown model identifier is provided to PayloadFactory.
  class UnknownModelError < StandardError; end

  # The PayloadFactory class is responsible for creating instances of payload builders
  # based on the provided model identifier.
  #
  # Attributes:
  # - model_id [String]: The identifier of the model.
  # - input [String]: The input string for what needs to be generated.
  # - options [Hash]: Additional options for payload creation.
  #
  class PayloadFactory
    def initialize(model_id, input, options = {})
      @model_id = model_id
      @input = input
      @options = options
    end

    # Creates a payload using the appropriate builder based on the model identifier.
    #
    # @return [Hash] The built payload.
    # @raise [UnknownModelError] if the model identifier is not recognized.
    def create
      builder_class = models_to_builders[@model_id]

      raise UnknownModelError, "Unknown modelId: #{@model_id}" unless builder_class

      builder_class.new(@input, @options)
    end

    # Defines a mapping from model identifiers to their respective builder classes.
    #
    # @return [Hash] The mapping of model identifiers to builder classes.
    def models_to_builders
      {
        'ai21labs.j2-mid-v1' => PayloadBuilders::Ai21Labs::J2MidV1,
        'ai21labs.j2-ultra-v1' => PayloadBuilders::Ai21Labs::J2UltraV1,
        'amazon.titan-image-generator-v1' => PayloadBuilders::Amazon::TitanImageGeneratorV1,
        'amazon.titan-text-lite-v1' => PayloadBuilders::Amazon::TitanTextLiteV1,
        'amazon.titan-text-express-v1' => PayloadBuilders::Amazon::TitanTextExpressV1,
        'anthropic.claude-v1' => PayloadBuilders::Anthropic::ClaudeV1,
        'anthropic.claude-instant-v1' => PayloadBuilders::Anthropic::ClaudeInstantV1,
        'anthropic.claude-v2' => PayloadBuilders::Anthropic::ClaudeV2,
        'cohere.command-light-text-v14' => PayloadBuilders::Cohere::CommandLightTextV14,
        'cohere.command-text-v14' => PayloadBuilders::Cohere::CommandTextV14,
        'cohere.embed-english-v3' => PayloadBuilders::Cohere::EmbedEnglishV3,
        'cohere.embed-multilingual-v3' => PayloadBuilders::Cohere::EmbedMultilingualV3,
        'meta.llama2-13b-chat-v1' => PayloadBuilders::Meta::Llama213bChatV1,
        'meta.llama2-70b-chat-v1' => PayloadBuilders::Meta::Llama270bChatV1,
        'stability.stable-diffusion-xl-v0' => PayloadBuilders::StabilityAi::StableDiffusionXlV0,
        'stability.stable-diffusion-xl-v1' => PayloadBuilders::StabilityAi::StableDiffusionXlV1
      }
    end
  end
end
