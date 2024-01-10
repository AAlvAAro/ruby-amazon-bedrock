# frozen_string_literal: true

require 'pry'

RSpec.shared_examples 'a payload builder' do
  it 'validates the payload structure' do
    payload_builder = described_class.new(prompt, options)
    payload = payload_builder.build

    expect(payload[:content_type]).to eq('application/json')
    expect(payload[:accept]).to eq('*/*')
    expect(payload[:body]).to eq(body)
  end
end

RSpec.shared_context 'a121 labs parameters' do
  let(:options) do
    {
      max_tokens: 100,
      temperature: 0.5,
      top_p: 2,
      stop_sequences: %w[stop1 stop2],
      count_penalty: 1,
      presence_penalty: 1,
      frequency_penalty: 1
    }
  end
  let(:body) do
    {
      prompt: prompt,
      maxTokenCount: 100,
      temperature: 0.5,
      topP: 2,
      stopSequences: %w[stop1 stop2],
      countPenalty: { scale: 1 },
      presencePenalty: { scale: 1 },
      frequencyPenalty: { scale: 1 }
    }.to_json
  end
end

RSpec.shared_context 'amazon titan parameters' do
  let(:options) do
    {
      max_tokens: 100,
      stop_sequences: %w[stop1 stop2],
      temperature: 0.5,
      top_p: 2
    }
  end
  let(:body) do
    {
      inputText: prompt,
      textGenerationConfig: {
        maxTokenCount: 100,
        stopSequences: %w[stop1 stop2],
        temperature: 0.5,
        topP: 2
      }
    }.to_json
  end
end

RSpec.shared_context 'anthropic parameters' do
  let(:options) do
    {
      max_tokens: 100,
      stop_sequences: [],
      temperature: 0.1,
      top_k: 150,
      top_p: 2
    }
  end
  let(:body) do
    {
      prompt: "\n\nHuman: #{prompt}\n\nAssistant:",
      max_tokens_to_sample: 100,
      temperature: 0.1,
      top_k: 150,
      top_p: 2,
      stop_sequences: [],
      anthropic_version: 'bedrock-2023-05-31'
    }.to_json
  end
end

RSpec.shared_context 'cohere command parameters' do
  let(:options) do
    {
      temperature: 0.1,
      top_p: 0.2,
      top_k: 0.3,
      max_tokens: 100,
      num_generations: 2,
      return_likelihoods: 'ALL',
      stop_sequences: %w[stop1 stop2],
      stream: true,
      truncate: 'LINE'
    }
  end
  let(:body) do
    {
      prompt: "#{prompt}:",
      temperature: 0.1,
      p: 0.2,
      k: 0.3,
      max_tokens: 100,
      num_generations: 2,
      return_likelihoods: 'ALL',
      stop_sequences: %w[stop1 stop2],
      stream: true,
      truncate: 'LINE'
    }.to_json
  end
end

RSpec.shared_context 'cohere embed parameters' do
  let(:options) do
    {
      input_type: 'classification',
      truncate: 'LEFT'
    }
  end
  let(:body) do
    {
      texts: [prompt],
      input_type: 'classification',
      truncate: 'LEFT'
    }.to_json
  end
end

RSpec.shared_context 'meta parameters' do
  let(:options) do
    {
      max_tokens: 256,
      temperature: 0.1,
      top_p: 0.2
    }
  end
  let(:body) do
    {
      prompt: prompt,
      max_gen_len: 256,
      temperature: 0.1,
      top_p: 0.2
    }.to_json
  end
end

RSpec.shared_context 'stability ai parameters' do
  let(:options) do
    {
      cfg_scale: 20,
      seed: 1,
      steps: 40
    }
  end
  let(:body) do
    {
      text_prompts: [
        { text: prompt }
      ],
      cfg_scale: 20,
      seed: 1,
      steps: 40
    }.to_json
  end
end
