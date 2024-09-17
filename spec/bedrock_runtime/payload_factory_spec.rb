# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_factory'

RSpec.describe RubyAmazonBedrock::PayloadFactory do
  let(:bedrock_models) do
    ["ai21.j2-mid-v1",
     "ai21.j2-ultra-v1",
     "amazon.titan-image-generator-v1",
     "amazon.titan-text-lite-v1",
     "amazon.titan-text-express-v1",
     "anthropic.claude-instant-v1",
     "anthropic.claude-v1",
     "anthropic.claude-v2",
     "cohere.command-light-text-v14",
     "cohere.command-text-v14",
     "cohere.embed-english-v3",
     "cohere.embed-multilingual-v3",
     "meta.llama2-13b-chat-v1",
     "meta.llama2-70b-chat-v1",
     "meta.llama3-70b-instruct-v1:0",
     "meta.llama3-8b-instruct-v1:0",
     "stability.stable-diffusion-xl-v0",
     "stability.stable-diffusion-xl-v1"]
  end
  let(:models_mapping) { described_class.new(nil, nil).models_to_builders }

  describe '#create' do
    context 'when model_id is a valid Bedrock model' do
      it 'creates a payload using the appropriate builder' do
        model_id = bedrock_models.sample
        input = 'test input'
        builder = described_class.new(model_id, input).create

        expect(builder).to be_a(models_mapping[model_id])
      end
    end

    context 'when model_id is not a valid Bedrock model' do
      it 'raises an UnknownModelError' do
        model_id = 'unknown_model'
        input = 'test input'
        payload_factory = described_class.new(model_id, input)

        expect { payload_factory.create }.to raise_error(RubyAmazonBedrock::UnknownModelError, "Unknown modelId: #{model_id}")
      end
    end
  end

  describe '#models_to_builders' do
    it 'defines a mapping of model identifiers to builder classes' do
      expect(models_mapping.keys).to contain_exactly(*bedrock_models)
    end
  end
end
