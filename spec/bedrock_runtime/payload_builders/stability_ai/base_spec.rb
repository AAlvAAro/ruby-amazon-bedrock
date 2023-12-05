# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/stability_ai/base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::StabilityAi::Base do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      text_prompts: [
        { text: input }
      ],
      cfg_scale: 10,
      seed: 0,
      steps: 50
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
