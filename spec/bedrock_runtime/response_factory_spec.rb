# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/response_factory'
require 'bedrock_runtime/response_builders/text'
require 'bedrock_runtime/response_builders/image'

RSpec.describe RubyAmazonBedrock::ResponseFactory do
  let(:response) { double('response') }
  let(:options) { { some_option: 'value' } }

  context 'when type is :text' do
    subject { described_class.new(:text, response) }

    it 'creates a Text response builder' do
      expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::Text)
    end
  end

  context 'when type is :image' do
    subject { described_class.new(:image, response, options) }

    it 'creates an Image response builder' do
      expect(subject.create).to be_a(RubyAmazonBedrock::ResponseBuilders::Image)
    end
  end

  context 'when type is invalid' do
    subject { described_class.new(:invalid_type, response) }

    it 'returns nil' do
      expect(subject.create).to be_nil
    end
  end
end
