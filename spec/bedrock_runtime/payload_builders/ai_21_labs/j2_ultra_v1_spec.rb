# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/ai_21_labs/j2_ultra_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Ai21Labs::J2UltraV1 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      prompt: input,
      maxTokens: 200,
      temperature: 0,
      topP: 1.0,
      stopSequences: [],
      countPenalty: { scale: 0 },
      presencePenalty: { scale: 0 },
      frequencyPenalty: { scale: 0 }
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('ai21.j2-ultra-v1')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
