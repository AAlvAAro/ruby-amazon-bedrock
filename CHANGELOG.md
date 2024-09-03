## [0.2.5] - 2024-08-29

-  Support for llama370b_instruct_v1
-  Explicitly add base64 gem to dependencies

## [0.2.4] - 2024-04-25

- Support the use of AWS Named Profiles for authentication

## [0.2.3] - 2024-01-12

- Fix A121 Labs bug for maxTokens parameter
- Allow Image generator to store images in S3 after being created

## [0.2.2] - 2024-01-10

- Fix bug for Amazon Titan Text Lite
- Allow payload builders to receive and set Model parameters as options

## [0.2.1] - 2023-12-25

- Make gem configurable
- Fix A121 Labs payloads
- Update README.md with A121 Labs documentation

## [0.2.0] - 2023-12-14

- Add Text and Image builders to be able to return text or save images depending on the model use case.
- Update README.md documentation to add more details about Amazon Bedrock settings and model usage.

## [0.1.1] - 2023-12-13

- Add documentation to README.md

## [0.1.0] - 2023-12-01

- Initial release.
- Add AmazonBedrock::Client to connect to AWS Bedrock GenAI models.
- Add unit tests, test coverage, bundle-audit for vulnerability checks and rubocop for code style checks.
