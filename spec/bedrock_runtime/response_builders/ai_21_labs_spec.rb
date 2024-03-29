# frozen_string_literal: true

require 'spec_helper'
require 'bedrock_runtime/response_builders/ai_21_labs'

RSpec.describe RubyAmazonBedrock::ResponseBuilders::Ai21Labs do
  let(:response_body) { { key1: 'value1', key2: 'value2' }.to_json }
  let(:response) { double('response', body: StringIO.new(response_body)) }

  context 'when parsing a valid JSON response' do
    subject { described_class.new(response) }

    it 'converts the response into a structured hash with symbolized keys' do
      result = subject.build
      expect(result).to be_a(Hash)
      expect(result.keys).to all(be_a(Symbol))
      expect(result[:full_response]).to eq(JSON.parse(response_body, symbolize_names: true))
    end
  end

  context 'when handling an invalid JSON response' do
    let(:invalid_response) { double('response', body: StringIO.new('invalid json')) }
    subject { described_class.new(invalid_response) }

    it 'raises a JSON::ParserError' do
      expect { subject.build }.to raise_error(JSON::ParserError)
    end
  end
end
