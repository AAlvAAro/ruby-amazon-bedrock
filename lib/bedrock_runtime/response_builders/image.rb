# frozen_string_literal: true

require 'base64'

module RubyAmazonBedrock
  module ResponseBuilders
    # The Image class is responsible for handling and processing image data received in a response.
    # It parses the response, extracts the image data, decodes it from Base64, and saves it as a file.
    class Image
      # Initializes a new instance of the Image class.
      #
      # @param response [Object] The raw response object which is an HTTP response.
      # The response should contain the image data in Base64 format.
      # @param options [Hash] Optional parameters, currently supporting :file_path for specifying
      # the location and name of the file to save the image. Default is 'image.jpg'.
      def initialize(response, options = {})
        @response = response
        @file_path = options[:file_path] || 'image.jpg'
      end

      # Processes the response to extract and decode image data, then saves it as a file.
      # This method parses the response body as JSON, extracts the first artifact which is
      # expected to be an image in Base64 format, decodes it, and writes it to a file.
      # If the operation is successful, a hash with a success status and file path is returned.
      # If an error occurs, a hash with a failure status and error details is returned.
      #
      # @return [Hash] A hash indicating the result of the operation.
      # If successful, the hash includes :result set to :success and :file_path.
      # If failure, the hash includes :result set to :failure and :error with exception details.
      def build
        response_object = JSON.parse(@response.body.read, symbolize_names: true)
        image_data = Base64.decode64(response_object[:artifacts].first[:base64])
        File.binwrite(@file_path, image_data)
        {
          result: :success,
          file_path: @file_path
        }
      rescue StandardError => e
        {
          result: :failure,
          error: e
        }
      end

      def model_id
        # noop
      end
    end
  end
end
