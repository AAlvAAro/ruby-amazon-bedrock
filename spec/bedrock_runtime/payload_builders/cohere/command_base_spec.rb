# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/cohere/command_base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Cohere::CommandBase do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      prompt: "#{input}:",
      max_tokens: 100,
      temperature: 0.8
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
