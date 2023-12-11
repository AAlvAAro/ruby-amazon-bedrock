# Ruby OpenAI

[![Gem Version](https://img.shields.io/gem/v/ruby-openai.svg)](https://rubygems.org/gems/ruby-amazon-bedrock)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/AAlvAAro/ruby-amazon-bedrock/blob/main/LICENSE.txt)
[![CircleCI Build Status](https://circleci.com/gh/AAlvAAro/ruby-amazon-bedrock.svg?style=shield)](https://circleci.com/gh/AAlvAAro/ruby-amazon-bedrock)

Seamless Integration with Amazon Bedrock API for AI-Powered Text and Image Generation in Ruby 🤖 + 💎. [AWS Bedrock API](https://aws.amazon.com/es/bedrock/).

Stream text with GPT-4, transcribe and translate audio with Whisper, or create images with DALL·E...

### Bundler

Add this line to your application's Gemfile:

```ruby
gem "ruby-amazon-bedrock"
```

And then execute:

```bash
$ bundle install
```

### Gem install

Or install with:

```bash
$ gem install ruby-amazon-bedrock
```

and require with:

```ruby
require "amazon-bedrock"
```

## Usage

<!-- Get amazon keys -->

- Get your your key from [https://platform.openai.com/account/api-keys](https://platform.openai.com/account/api-keys)
- If you belong to multiple organizations, you can get your Organization ID from [https://platform.openai.com/account/org-settings](https://platform.openai.com/account/org-settings)

### Quickstart

For a quick test you can pass your token directly to a new client:

```ruby
client = RubyAmazonBedrock::Client.new(aws_region: "your_aws_region", aws_access_key_id: "your_access_key_id", aws_access_token: "your_access_token")
```

### With dotenv

You can use something like [dotenv](https://github.com/motdotla/dotenv) or another environment variables gem to pass the keys safely into your environments.
Then you can create a client like this:

```ruby
client = AmazonBedrock::Client.new
```

### Models

There are different models that can be used to generate text. For a full list and to retrieve information:

<!-- Add examples for each model: -->

```ruby
client.invoke_model('model-name', 'Prompt')
```

With options:

```ruby
client.invoke_model('model-name', 'Prompt', { option1: 'option1', option2: 'option2'})
```

### AILabs

Give information about this model

```ruby
response = client.embeddings(
    parameters: {
        model: "text-embedding-ada-002",
        input: "The food was delicious and the waiter..."
    }
)

puts response.dig("data", 0, "embedding")
# => Vector representation of your embedding
```

### Meta

Give information about this model

```ruby
client.invoke_model
```

### Errors

HTTP errors can be caught like this:

```
  begin
    AmazonBedrock::Client.new.models.retrieve(id: "text-ada-001")
  rescue AmazonBedrock::Error => e
    raise "Got a Faraday error: #{e}"
  end
```

<!-- ## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/AAlvAAro/ruby-amazon-bedrock>. -->

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

<!-- ## Code of Conduct

Everyone interacting in the Ruby Amazon Bedrock project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/AAlvAAro/ruby-amazon-bedrock/blob/main/CODE_OF_CONDUCT.md). -->
