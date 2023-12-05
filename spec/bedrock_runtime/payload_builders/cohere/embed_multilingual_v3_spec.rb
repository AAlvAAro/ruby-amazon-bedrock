# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/cohere/embed_multilingual_v3'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Cohere::EmbedMultilingualV3 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      texts: [input],
      input_type: 'search_document'
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('cohere.embed-multilingual-v3')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
