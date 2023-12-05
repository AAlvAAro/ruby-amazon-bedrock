# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/amazon/titan_image_generator_v1'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Amazon::TitanImageGeneratorV1 do
  let(:input) { 'example_input' }
  let(:options) { { key: 'value' } }
  let(:body) do
    {
      taskType: "TEXT_IMAGE",
      textToImageParams: {
        text: input,
        negativeTtext: nil
      },
      imageGenerationConfig: {
        numberOfImages: 1,
        quality: 'standard',
        height: 1024,
        width: 1024,
        cfgScale: 8.0,
        seed: 0
      }
    }.to_json
  end

  describe '#build' do
    it 'returns a hash with the expected structure' do
      payload_builder = described_class.new(input, options)
      payload = payload_builder.build

      expect(payload[:model_id]).to eq('amazon.titan-image-generator-v1')
      expect(payload[:content_type]).to eq('application/json')
      expect(payload[:accept]).to eq('application/json')
      expect(payload[:body]).to eq(body)
    end
  end
end
