# frozen_string_literal: true

require_relative 'response_builders/ai_21_labs'
require_relative 'response_builders/amazon_text'
require_relative 'response_builders/amazon_image'
require_relative 'response_builders/anthropic'
require_relative 'response_builders/cohere_command'
require_relative 'response_builders/cohere_embed'
require_relative 'response_builders/meta'
require_relative 'response_builders/stability_ai'

module RubyAmazonBedrock
  # The ResponseFactory class is a factory for creating different types of response builder objects.
  # It is designed to instantiate and return an object of a specific response builder class
  class ResponseFactory
    # Initializes a new instance of the ResponseFactory class.
    #
    # @param model_id [String] The model_id of response builder to create (Amazon Bedrock model id).
    # @param response [Object] The raw response object, typically an HTTP response.
    # @param options [Object] optional attributes to customize the response.
    def initialize(model_id, response, options = {})
      @model_id = model_id
      @response = response
      @options = options
    end

    # Creates and returns an instance of the specified response builder.
    # This method uses the @type instance variable to determine which type of response
    # builder to instantiate and return.
    #
    # @return [ResponseBuilders::Class] Depending on the model_id,
    # it returns an instance of any of the response builder classes.
    # Returns nil if the model_id does not match any known response builders.
    def create
      builder_class = models_to_builders[@model_id]
      builder_class.new(@response, @options)
    end

    # Defines a mapping from model identifiers to their respective builder classes.
    #
    # @return [Hash] The mapping of model identifiers to builder classes.
    def models_to_builders
      {
        'ai21.j2-mid-v1' => ResponseBuilders::Ai21Labs,
        'ai21.j2-ultra-v1' => ResponseBuilders::Ai21Labs,
        'amazon.titan-image-generator-v1' => ResponseBuilders::AmazonImage,
        'amazon.titan-text-lite-v1' => ResponseBuilders::AmazonText,
        'amazon.titan-text-express-v1' => ResponseBuilders::AmazonText,
        'anthropic.claude-instant-v1' => ResponseBuilders::Anthropic,
        'anthropic.claude-v1' => ResponseBuilders::Anthropic,
        'anthropic.claude-v2' => ResponseBuilders::Anthropic,
        'cohere.command-light-text-v14' => ResponseBuilders::CohereCommand,
        'cohere.command-text-v14' => ResponseBuilders::CohereCommand,
        'cohere.embed-english-v3' => ResponseBuilders::CohereEmbed,
        'cohere.embed-multilingual-v3' => ResponseBuilders::CohereEmbed,
        'meta.llama2-13b-chat-v1' => ResponseBuilders::Meta,
        'meta.llama2-70b-chat-v1' => ResponseBuilders::Meta,
        'meta.llama3-70b-instruct-v1:0' => ResponseBuilders::Meta,
        'stability.stable-diffusion-xl-v0' => ResponseBuilders::StabilityAi,
        'stability.stable-diffusion-xl-v1' => ResponseBuilders::StabilityAi
      }
    end
  end
end
