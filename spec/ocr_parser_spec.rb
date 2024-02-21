require_relative '../lib/ocr_parser'

describe OCRParser do
  let(:valid_policy_code) { 'spec/fixtures/valid-policy-code.txt' }
  let(:illegible_policy_code) { 'spec/fixtures/ill-policy-code.txt' }
  let(:output_file) { 'spec/fixtures/output.txt' }

  describe '#parse_policy_numbers' do
    it 'parses policy numbers from the file' do
      ocr_parser = OCRParser.new(valid_policy_code)
      policy_numbers = ocr_parser.parse_policy_numbers

      expect(policy_numbers).to be_an(Array)
      expect(policy_numbers).not_to be_empty
      expect(policy_numbers).to include('123456789')
    end
  end

  describe '#calculate_checksum' do
    it 'returns true for a valid policy number' do
      expect(OCRUtils.calculate_checksum('123456789')).to be(true)
    end

    it 'returns false for an invalid policy number' do
      expect(OCRUtils.calculate_checksum('123456788')).to be(false)
    end
  end

  describe '#parse_and_write_output' do
    it 'writes the output file with correct format' do
      ocr_parser = OCRParser.new(valid_policy_code)
      ocr_parser.parse_and_write_output(output_file)

      # Check the content of the output file
      output_content = File.read(output_file).strip
      expected_content = "123456789"

      expect(output_content).to eq(expected_content)
    end

    it 'writes the output file with correct format' do
      ocr_parser = OCRParser.new(illegible_policy_code)
      ocr_parser.parse_and_write_output(output_file)

      # Check the content of the output file
      output_content = File.read(output_file).strip
      expected_content = "?66437?4? ILL"

      expect(output_content).to eq(expected_content)
    end
  end
end
