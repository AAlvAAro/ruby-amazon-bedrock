# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/anthropic/base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Anthropic::Base do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      prompt: "\n\nHuman: #{input}\n\nAssistant:",
      max_tokens_to_sample: 300,
      temperature: 0.5,
      top_k: 250,
      top_p: 1,
      stop_sequences: [
        '\n\nHuman'
      ],
      anthropic_version: 'bedrock-2023-05-31'
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
