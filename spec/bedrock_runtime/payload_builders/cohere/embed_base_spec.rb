# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/cohere/embed_base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Cohere::EmbedBase do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      texts: [prompt],
      input_type: 'search_document',
      truncate: 'NONE'
    }.to_json
  end

  describe '#build' do
    it_behaves_like 'a payload builder'

    context 'with custom parameters' do
      it_should_behave_like 'a payload builder'
    end
  end
end
