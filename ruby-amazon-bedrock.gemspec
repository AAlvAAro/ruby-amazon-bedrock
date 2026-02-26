# frozen_string_literal: true

require_relative "lib/amazon_bedrock/version"

Gem::Specification.new do |spec|
  spec.name = "ruby-amazon-bedrock"
  spec.version = RubyAmazonBedrock::VERSION
  spec.authors = ["Alvaro Delgado"]
  spec.email = ["hola@alvarodelgado.dev"]

  spec.summary = "[DEPRECATED] Seamless Integration with Amazon Bedrock for AI-Powered Text and Image Generation in Ruby. Use RubyLLM instead."
  spec.description = "DEPRECATED: This gem is no longer maintained. Please use RubyLLM (https://github.com/crmne/ruby_llm) instead, " \
    "which provides a more complete and actively maintained solution for working with LLMs in Ruby."
  spec.homepage = "https://github.com/AAlvAAro/ruby-amazon-bedrock"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AAlvAAro/ruby-amazon-bedrock"
  spec.metadata["changelog_uri"] = "https://github.com/AAlvAAro/ruby-amazon-bedrock/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.post_install_message = <<~MSG
    WARNING: ruby-amazon-bedrock is deprecated and no longer maintained.
    Please switch to RubyLLM (https://github.com/crmne/ruby_llm) which provides
    a more complete and actively maintained solution for working with LLMs in Ruby.
  MSG

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
      f.end_with?(*%w[.gem])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-bedrockruntime", "~> 1.0"
  spec.add_dependency "aws-sdk-s3", "~> 1.0"
  spec.add_dependency "base64", "~> 0.2"
end
