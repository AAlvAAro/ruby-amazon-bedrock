# frozen_string_literal: true

require 'aws-sdk-bedrockruntime'

module RubyAmazonBedrock
  # Client for interfacing with the Amazon Bedrock Runtime.
  #
  # This class provides methods to initialize a client for AWS BedrockRuntime
  # and to invoke a model using the client.
  class Client
    # Initializes the AWS BedrockRuntime client.
    #
    # @note The AWS credentials and region are fetched from the environment variables.
    def initialize
      @client = Aws::BedrockRuntime::Client.new(
        region: ENV.fetch("AWS_REGION", nil),
        access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID", nil),
        secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY", nil)
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
      payload_builder_class = PayloadFactory.new(id, input, options).create
      response = @client.invoke_model(payload_builder_class.build)
      JSON.parse(response.body.read, symbolize_names: true)
    end
  end
end
