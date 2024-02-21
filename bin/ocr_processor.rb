require_relative '../lib/ocr_parser.rb'

user_story_1_file_path = File.expand_path('../data/user-story1.txt', __dir__)
ocr_parser = OCRParser.new(user_story_1_file_path)


# User Story 1:
policy_numbers = ocr_parser.parse_policy_numbers()
puts policy_numbers


# User Story 3:
output_file_path = File.expand_path('../data/user-story3-output.txt', __dir__)
ocr_parser.parse_and_write_output(output_file_path)