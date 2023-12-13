# Ruby Amazon Bedrock

[![CircleCI Build Status](https://circleci.com/gh/AAlvAAro/ruby-amazon-bedrock.svg?style=shield)](https://circleci.com/gh/AAlvAAro/ruby-amazon-bedrock)

Seamless Integration with Amazon Bedrock API for AI-Powered Text and Image Generation in Ruby 🤖 + 💎. [Amazon Bedrock API](https://aws.amazon.com/es/bedrock/).

Amazon Bedrock is a fully managed service that makes FMs from leading AI startups and Amazon available via an API, so you can choose from a wide range of FMs to find the model that is best suited for your use case.

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

## Credentials

In order to use Amazon Bedrock, you'll need your secure credentials just as any other AWS service. Get your keys from AWS IAM (Identity and Access Management) [https://us-east-1.console.aws.amazon.com/iam](https://us-east-1.console.aws.amazon.com/iam)

### Quickstart

For a quick test you can pass your token directly to a new client:

```ruby
client = RubyAmazonBedrock::Client.new(aws_region: "your_aws_region", aws_access_key_id: "your_access_key_id", aws_access_token: "your_access_token")
```

### Models Providers

Amazon Bedrock is a fully managed service that makes FMs from leading AI startups and Amazon available via an API, so you can choose from a wide range of FMs to find the model that is best suited for your use case.

### AI21 Labs

Businesses use AI21's Jurassic family of leading LLMs to build generative AI-driven applications and services leveraging existing organizational data. Jurassic supports cross-industry use cases including long and short-form text generation, contextual question answering, summarization, and classification. Designed to follow natural language instructions, Jurassic is trained on a massive corpus of web text and supports six languages in addition to English. [See more ...](https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=ai21.j2-ultra-v1)

How to call AI21 models:

Jurassic-2 Ultra

```ruby
client.invoke_model('ai21.j2-ultra-v1', 'Your prompt goes here ...')
```

Jurassic-2 Mid

```ruby
client.invoke_model('ai21.j2-mid-v1', 'Your prompt goes here ...')
```

### Amazon Titan

Amazon Titan Foundation Models are pre-trained on large datasets, making them powerful, general-purpose models. Use them as is, or customize them by fine tuning the models with your own data for a particular task without annotating large volumes of data. [See more ...](https://us-east-1.console.aws.amazon.com/bedrock/home?region=us-east-1#/providers?model=amazon.titan-embed-text-v1)

How to call Amazon Titan text models:

Titan Text G1 - Lite

```ruby
client.invoke_model('amazon.titan-text-lite-v1', 'Your prompt goes here ...')
```

Titan Text G1 - Express

```ruby
client.invoke_model('amazon.titan-text-express-v1', 'Your prompt goes here ...')
```

### Anthropic

Anthropic offers the Claude family of large language models purpose built for conversations, summarization, Q&A, workflow automation, coding and more. Early customers report that Claude is much less likely to produce harmful outputs, easier to converse with, and more steerable - so you can get your desired output with less effort. Claude can also take direction on personality, tone, and behavior.

How to call Anthropic models:

Claude Instant 1.2

```ruby
client.invoke_model('anthropic.claude-instant-v1', 'Your prompt goes here ...')
```

Claude 1.3

```ruby
client.invoke_model('anthropic.claude-v1', 'Your prompt goes here ...')
```

Claude 2

```ruby
client.invoke_model('anthropic.claude-v2', 'Your prompt goes here ...')
```

Claude 2.1

<!-- TODO: Add this model to the Anthropic library -->

```ruby
client.invoke_model('anthropic.claude-v2:1', 'Your prompt goes here ...')
```

### Cohere

Cohere models are text generation models for business use cases. Cohere models are trained on data that supports reliable business applications, like text generation, summarization, copywriting, dialogue, extraction, and question answering.

How to call Cohere command models:

Command

```ruby
client.invoke_model('cohere.command-text-v14', 'Your prompt goes here ...')
```

Command Light

```ruby
client.invoke_model('cohere.command-light-text-v14', 'Your prompt goes here ...')
```

How to call Cohere embed models:

Command English

```ruby
client.invoke_model('cohere.embed-english-v3', 'Your prompt goes here ...')
```

Command Embed Multilingual

```ruby
client.invoke_model('cohere.embed-multilingual-v3', 'Your prompt goes here ...')
```

### Meta

Meta is looking to unlock the power of large language models. Our latest version of Llama is now accessible to individuals, creators, researchers and businesses of all sizes so that they can experiment, innovate and scale their ideas responsibly.

How to call Meta models:

Llama 2 Chat 13B

```ruby
client.invoke_model('meta.llama2-13b-chat-v1', 'Your prompt goes here ...')
```

Llama 2 Chat 70B

```ruby
client.invoke_model('meta.llama2-70b-chat-v1', 'Your prompt goes here ...')
```

### Stability AI

Stability AI is the world's leading open-source generative artificial intelligence company, collaborating with public and private sector partners to bring next generation infrastructure to a global audience.

How to call Stability AI models:

SDXL 0.8

```ruby
client.invoke_model('stability.stable-diffusion-xl-v0', 'Your prompt goes here ...')
```

SDXL 1.0

```ruby
client.invoke_model('stability.stable-diffusion-xl-v1', 'Your prompt goes here ...')
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
