# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/anthropic/claude_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Anthropic::ClaudeV1 do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      prompt: "\n\nHuman: #{prompt}\n\nAssistant:",
      max_tokens_to_sample: 200,
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
    it_behaves_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'anthropic parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
