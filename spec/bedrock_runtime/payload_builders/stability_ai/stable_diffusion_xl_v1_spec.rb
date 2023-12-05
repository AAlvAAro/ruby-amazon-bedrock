# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/stability_ai/stable_diffusion_xl_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::StabilityAi::StableDiffusionXlV1 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      text_prompts: [
        { text: input }
      ],
      cfg_scale: 10,
      seed: 0,
      steps: 50
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('stability.stable-diffusion-xl-v1')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('*/*')
      expect(payload[:body]).to eq(body)
    end
  end
end
