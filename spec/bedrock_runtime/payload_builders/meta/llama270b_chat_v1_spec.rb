# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/meta/llama270b_chat_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Meta::Llama270bChatV1 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      prompt: input,
      max_gen_len: 512,
      temperature: 0.2,
      top_p: 0.9
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('meta.llama2-70b-chat-v1')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
