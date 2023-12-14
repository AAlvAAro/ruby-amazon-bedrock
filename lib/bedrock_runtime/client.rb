# frozen_string_literal: true

require 'base64'
require 'aws-sdk-bedrockruntime'
require 'bedrock_runtime/payload_factory'
require 'bedrock_runtime/response_factory'
require 'pry'

module RubyAmazonBedrock
  # Client for interfacing with the Amazon Bedrock Runtime.
  #
  # This class provides methods to initialize a client for AWS BedrockRuntime
  # and to invoke a model using the client.
  class Client
    # Initializes the AWS BedrockRuntime client.
    #
    # @note The AWS credentials and region are fetched from the environment variables.
    def initialize(region:, access_key_id:, secret_access_key:)
      @client = Aws::BedrockRuntime::Client.new(
        region: region,
        access_key_id: access_key_id,
        secret_access_key: secret_access_key
      )
    end

    # Invokes a model using the Bedrock Runtime client.
    #
    # @param id [String] The ID of the model to be invoked.
    # @param input [String] The input string for what needs to be generated.
    # @param options [Hash] Additional options for the model invocation.
    # @return [Aws::BedrockRuntime::Types::InvokeModelOutput] The output from invoking the model.
    # @example Invoke a model with specific ID and input
    #   client = RubyAmazonBedrock::Client.new
    #   client.invoke_model(
    # 		id: 'model_id', input: 'This is what you want to generate', options: { option_key: 'option_value' }
    # 	)
    def invoke_model(id:, input:, options: {})
      payload_builder_class = RubyAmazonBedrock::PayloadFactory.new(id, input, options).create
      response = @client.invoke_model(payload_builder_class.build)

      response_builder_class = RubyAmazonBedrock::ResponseFactory.new(payload_builder_class.type, response,
                                                                      options).create
      response_builder_class.build
    end
  end
end
