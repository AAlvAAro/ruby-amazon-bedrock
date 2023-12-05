# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/payload_builders/base'

RSpec.describe RubyAmazonBedrock::PayloadBuilders::Base do
  describe '#initialize' do
    it 'creates a new instance with input and options' do
      input = 'example_input'
      options = { key: 'value' }

      payload_builder = described_class.new(input, options)

      expect(payload_builder.instance_variable_get(:@input)).to eq(input)
      expect(payload_builder.instance_variable_get(:@options)).to eq(options)
    end
  end

  describe '#build' do
    it 'raises NotImplementedError' do
      payload_builder = described_class.new('example_input')

      expect { payload_builder.build }.to raise_error(NotImplementedError)
    end
  end

  describe '#model_id' do
    it 'raises NotImplementedError' do
      payload_builder = described_class.new('example_input')

      expect { payload_builder.model_id }.to raise_error(NotImplementedError)
    end
  end
end
