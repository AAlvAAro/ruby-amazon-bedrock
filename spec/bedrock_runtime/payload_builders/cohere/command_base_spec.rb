# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/cohere/command_base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Cohere::CommandBase do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      prompt: "#{prompt}:",
      temperature: 0.9,
      p: 0.75,
      k: 0,
      max_tokens: 20,
      num_generations: 1,
      return_likelihoods: 'GENERATION',
      stop_sequences: [],
      stream: false,
      truncate: 'NONE'
    }.to_json
  end

  describe '#build' do
    it_behaves_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'cohere command parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
