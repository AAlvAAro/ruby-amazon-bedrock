# frozen_string_literal: true

require_relative "bedrock/version"

module RubyAmazonBedrock
  # Raised when an unknown model identifier is provided to PayloadFactory.
  class UnknownModelError < StandardError; end
  class Error < StandardError; end
end
