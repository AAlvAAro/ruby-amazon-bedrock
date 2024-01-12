# frozen_string_literal: true

require 'aws-sdk-s3'
require 'base64'
require 'digest'

module RubyAmazonBedrock
  module ResponseBuilders
    # The AmazonImage class is responsible for handling and processing image data received in a response.
    # It parses the response, extracts the image data, decodes it from Base64, and saves it as a file.
    class AmazonImage
      # Initializes a new instance of the AmazonImage class.
      #
      # @param response [Object] The raw response object which is an HTTP response.
      # The response should contain the image data in Base64 format.
      # @param options [Hash] Optional parameters, currently supporting :file_path for specifying
      # the location and name of the file to save the image. Default is 'image.jpg'.
      def initialize(response, options = {})
        @response = response
        @file_path = options[:file_path] || 'image.jpg'
        @upload = options[:upload] || false
      end

      # Processes the response to extract and decode image data, then saves it as a file.
      # This method parses the response body as JSON, extracts the first artifact which is
      # expected to be an image in Base64 format, decodes it, and writes it to a file.
      # If the operation is successful, a hash with a success status and file path is returned.
      # If an error occurs, a hash with a failure status and error details is returned.
      #
      # @return [Hash] A hash indicating the result of the operation.
      # If successful, the hash includes :result set to :success and :file_path.
      # If upload option is provided it will also include :s3_url after saving the image in S3.
      # If failure, the hash includes :result set to :failure and :error with exception details.
      def build
        response_object = JSON.parse(@response.body.read, symbolize_names: true)
        image_data = Base64.decode64(response_object[:artifacts].first[:base64])
        File.binwrite(@file_path, image_data)

        upload_image if can_upload?

        {
          result: :success,
          file_path: @file_path,
          s3_url: s3_url
        }.compact
      rescue StandardError => e
        {
          result: :failure,
          error: e
        }
      end

      private

      def bucket
        @bucket ||= ENV.fetch('AWS_S3_BUCKET')
      end

      def key
        @key ||= Digest::SHA1.hexdigest(Time.now.to_s)[0..11]
      end

      def can_upload?
        @upload && bucket && File.exist?(@file_path)
      end

      def s3_url
        s3_resource = Aws::S3::Resource.new
        object = s3_resource.bucket(bucket).object(key)
        object.presigned_url(:get)
      end

      def upload_image
        s3_client = Aws::S3::Client.new
        s3_client.put_object(
          bucket: bucket,
          key: key,
          body: File.read(@file_path)
        )
      rescue StandardError => e
        Rails.logger.error("Error uploading image to S3: #{e}")
      end
    end
  end
end
