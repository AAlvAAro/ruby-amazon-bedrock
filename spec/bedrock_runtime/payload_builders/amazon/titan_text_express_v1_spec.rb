# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/amazon/titan_text_express_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Amazon::TitanTextExpressV1 do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      inputText: prompt,
      textGenerationConfig: {
        maxTokenCount: 4096,
        stopSequences: [],
        temperature: 0,
        topP: 1
      }
    }.to_json
  end

  describe '#build' do
    it_should_behave_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'amazon titan parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
