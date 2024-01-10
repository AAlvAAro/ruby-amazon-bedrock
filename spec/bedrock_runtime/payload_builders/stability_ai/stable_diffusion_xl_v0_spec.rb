# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/stability_ai/stable_diffusion_xl_v0'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::StabilityAi::StableDiffusionXlV0 do
  let(:prompt) { 'example_prompt' }
  let(:options) { {} }
  let(:body) do
    {
      text_prompts: [
        { text: prompt }
      ],
      cfg_scale: 10,
      seed: 0,
      steps: 30
    }.to_json
  end

  describe '#build' do
    it_should_behave_like 'a payload builder'

    context 'with custom parameters' do
      include_context 'stability ai parameters'
      it_should_behave_like 'a payload builder'
    end
  end
end
