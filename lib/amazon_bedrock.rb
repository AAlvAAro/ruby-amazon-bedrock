# frozen_string_literal: true

require_relative "amazon_bedrock/version"
require_relative "bedrock_runtime/client"

# The RubyAmazonBedrock module serves as a namespace for classes that
# interact with Amazon Bedrock Service. It includes configuration management
# and custom error classes for handling AWS service interactions.
module RubyAmazonBedrock
  # Raised when an unknown model identifier is provided to PayloadFactory.
  class UnknownModelError < StandardError; end
  class Error < StandardError; end

  # Configuration class for setting up AWS credentials and region.
  class Configuration
    attr_accessor :region, :access_key_id, :secret_access_key

    # Initializes a new Configuration instance, loading values from
    # environment variables or setting them to nil by default so the
    # values can be dynamically set.
    def initialize
      @region = ENV.fetch('AWS_REGION', nil)
      @access_key_id = ENV.fetch('AWS_ACCESS_KEY_ID', nil)
      @secret_access_key = ENV.fetch('AWS_SECRET_ACCESS_KEY', nil)
    end
  end

  class << self
    # Returns the current configuration instance or creates a new one.
    #
    # @return [Configuration] the current configuration instance
    def configuration
      @configuration ||= Configuration.new
    end

    # Provides a block to configure the RubyAmazonBedrock settings.
    #
    # @yield [Configuration] Yields the current configuration to a block.
    def configure
      yield(configuration)
    end
  end
end
