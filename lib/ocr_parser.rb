require_relative 'ocr_utils'

class OCRParser
  include OCRUtils

  def initialize(file_path)
    @file_path = file_path
  end

  def parse_policy_numbers()
    # Read the file and split it into entries
    entries = File.read(@file_path).split("\n\n")
    policy_numbers = []
    entries.each do |entry|
      # Split each entry into lines
      lines = entry.split("\n")
      # Initialize an array to store the digits of the policy number
      digits = []
      # Loop through the lines and extract digits
      (0...9).each do |i|
        digit_slice = lines.map { |line| line[i * 3, 3] }
        digit = OCRUtils.parse_digit(digit_slice.join)
        digits << digit
      end
      # Concatenate the digits to form the policy number
      policy_numbers << digits.join
    end
    policy_numbers
  end
end