# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/meta/llama270b_chat_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Meta::Llama270bChatV1 do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      prompt: prompt,
      max_gen_len: 512,
      temperature: 0.5,
      top_p: 0.9
    }.to_json
  end

  describe '#build' do
    it_should_behave_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'meta parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
