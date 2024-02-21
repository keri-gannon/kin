require_relative '../lib/parser.rb'

# User Story 1:
user_story_1_file_path = File.expand_path('../data/user-story1.txt', __dir__)
parser = Parser.new(user_story_1_file_path)
policy_numbers = parser.parse_policy_numbers()
puts policy_numbers
