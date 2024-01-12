# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/ai_21_labs/base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Ai21Labs::Base do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      prompt: prompt,
      maxTokens: 200,
      temperature: 0,
      topP: 1,
      stopSequences: [],
      countPenalty: { scale: 0 },
      presencePenalty: { scale: 0 },
      frequencyPenalty: { scale: 0 }
    }.to_json
  end

  describe '#build' do
    it_should_behave_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'a121 labs parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
