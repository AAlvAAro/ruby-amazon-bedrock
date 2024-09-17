# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/client'

RSpec.describe RubyAmazonBedrock::Client do
  let(:client) do
    described_class.new(
      region: ENV.fetch('AWS_REGION', nil),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID', nil),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY', nil),
      profile: ENV.fetch('AWS_PROFILE', nil)
    )
  end

  describe '#invoke_model' do
    models = [
      # 'amazon.titan-image-generator-v1', This model is currently in preview release. Changes may be made to this model.
      'amazon.titan-text-lite-v1',
      'amazon.titan-text-express-v1',
      'anthropic.claude-instant-v1',
      'anthropic.claude-v1',
      'anthropic.claude-v2',
      'cohere.command-light-text-v14',
      'cohere.command-text-v14',
      'cohere.embed-english-v3',
      'cohere.embed-multilingual-v3',
      'meta.llama2-13b-chat-v1',
      'meta.llama2-70b-chat-v1',
      'meta.llama3-70b-instruct-v1:0',
      'meta.llama3-8b-instruct-v1:0',
      'stability.stable-diffusion-xl-v0',
      'stability.stable-diffusion-xl-v1'
    ]

    models.each do |model|
      it "invokes #{model} model with the given payload" do
        VCR.use_cassette("models/#{model}") do
          response = client.invoke_model(id: model, prompt: 'Give me a short list of steps for creating a Ruby gem', options: {})
          expect(response).to be_a(Hash)
        end
      end
    end

    context 'when the model is not found' do
      it 'raises an UnkownModelError' do
        VCR.use_cassette('models/not_found') do
          expect { client.invoke_model(id: 'unknown-model', prompt: 'Hello World', options: {}) }.to raise_error(RubyAmazonBedrock::UnknownModelError)
        end
      end
    end
  end
end
