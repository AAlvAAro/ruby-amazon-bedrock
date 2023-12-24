# frozen_string_literal: true

require 'dotenv/load'
require 'vcr'

require 'amazon_bedrock'
require 'bedrock_runtime/client'
require 'bedrock_runtime/payload_factory'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock # or :faraday if you're using Faraday
  config.configure_rspec_metadata!
end
