# frozen_string_literal: true

require_relative "bedrock/version"
require_relative "bedrock_runtime/client"

module RubyAmazonBedrock
  # Raised when an unknown model identifier is provided to PayloadFactory.
  class UnknownModelError < StandardError; end
  class Error < StandardError; end
end
