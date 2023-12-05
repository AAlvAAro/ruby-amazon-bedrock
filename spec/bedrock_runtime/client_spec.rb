# frozen_string_literal: true

require 'bedrock_runtime/client'
require 'spec_helper'
require 'webmock/rspec'

RSpec.describe RubyAmazonBedrock::Client do
  let(:client) { described_class.new }

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
      'stability.stable-diffusion-xl-v0',
      'stability.stable-diffusion-xl-v1'
    ]

    models.each do |model|
      it "invokes an #{model} with the given payload" do
        VCR.use_cassette("models/#{model}") do
          response = client.invoke_model(id: model, input: 'Hello World', options: {})
          expect(response).to eq(response)
        end
      end
    end

    context 'when the model is not found' do
      it 'raises an UnkownModelError' do
        VCR.use_cassette('models/not_found') do
          expect { client.invoke_model(id: 'unknown-model', input: 'Hello World', options: {}) }.to raise_error(RubyAmazonBedrock::UnknownModelError)
        end
      end
    end
  end
end
