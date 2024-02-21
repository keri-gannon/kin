require_relative 'ocr_utils'

class OCRParser
  include OCRUtils

  def initialize(file_path)
    @file_path = file_path
  end

  def parse_and_write_output(output_file_path)
    entries = File.read(@file_path).split("\n\n")

    File.open(output_file_path, 'w') do |output_file|
      entries.each do |entry|
        lines = entry.split("\n")
        digits = []

        (0...9).each do |i|
          digit_slice = lines.map { |line| line[i * 3, 3] }
          digit = OCRUtils.parse_digit(digit_slice.join)
          digits << digit
        end

        policy_number = digits.join
        status = OCRUtils.calculate_checksum(policy_number) ? '' : 'ERR'
        status = 'ILL' if policy_number.include?('?')

        output_file.puts "#{policy_number} #{status}"
      end
    end
  end

  def parse_policy_numbers
    entries = File.read(@file_path).split("\n\n")
    policy_numbers = []

    entries.each do |entry|
      lines = entry.split("\n")
      digits = []

      (0...9).each do |i|
        digit_slice = lines.map { |line| line[i * 3, 3] }
        digit = OCRUtils.parse_digit(digit_slice.join)
        digits << digit
      end

      policy_numbers << digits.join
    end

    policy_numbers
  end
end
