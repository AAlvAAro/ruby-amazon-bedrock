# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/amazon/titan_text_express_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Amazon::TitanTextExpressV1 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      inputText: input,
      textGenerationConfig: {
        maxTokenCount: 4096,
        stopSequences: [],
        temperature: 0,
        topP: 1
      }
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('amazon.titan-text-express-v1')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
