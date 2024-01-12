# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/response_factory'
require 'bedrock_runtime/response_builders/ai_21_labs'
require 'bedrock_runtime/response_builders/amazon_text'
require 'bedrock_runtime/response_builders/amazon_image'
require 'bedrock_runtime/response_builders/anthropic'
require 'bedrock_runtime/response_builders/cohere_command'
require 'bedrock_runtime/response_builders/cohere_embed'
require 'bedrock_runtime/response_builders/meta'
require 'bedrock_runtime/response_builders/stability_ai'

RSpec.describe RubyAmazonBedrock::ResponseFactory do
  let(:response) { double('response') }
  let(:options) { { some_option: 'value' } }

  context 'when model_id is from ai_21_labs' do
    ['ai21.j2-mid-v1', 'ai21.j2-ultra-v1'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an Ai21Labs response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::Ai21Labs)
      end
    end
  end

  context 'when model_id is from Amazon text generators' do
    ['amazon.titan-text-lite-v1', 'amazon.titan-text-express-v1'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::AmazonText)
      end
    end
  end

  context 'when model_id is from Amazon image generators' do
    subject { described_class.new('amazon.titan-image-generator-v1', response) }

    it 'creates an AmazonText response builder' do
      expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::AmazonImage)
    end
  end

  context 'when model_id is from Anthropic generators' do
    ['anthropic.claude-instant-v1', 'anthropic.claude-v1', 'anthropic.claude-v2'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::Anthropic)
      end
    end
  end

  context 'when model_id is from Cohere commnand generators' do
    ['cohere.command-light-text-v14', 'cohere.command-text-v14'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::CohereCommand)
      end
    end
  end

  context 'when model_id is from Cohere embed generators' do
    ['cohere.embed-english-v3', 'cohere.embed-multilingual-v3'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::CohereEmbed)
      end
    end
  end

  context 'when model_id is from Meta generators' do
    ['meta.llama2-13b-chat-v1', 'meta.llama2-70b-chat-v1'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::Meta)
      end
    end
  end

  context 'when model_id is from Stability AI generators' do
    ['stability.stable-diffusion-xl-v0', 'stability.stable-diffusion-xl-v0'].each do |model_id|
      subject { described_class.new(model_id, response) }

      it 'creates an AmazonText response builder' do
        expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::StabilityAi)
      end
    end
  end
end
