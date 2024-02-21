# spec/ocr_parser_spec.rb
require_relative '../lib/ocr_parser'

describe OCRParser do
  let(:user_story1) { 'spec/fixtures/user-story1.txt' }

  describe '#parse_policy_numbers' do
    it 'parses policy numbers from the file' do
      ocr_parser = OCRParser.new(user_story1)
      policy_numbers = ocr_parser.parse_policy_numbers

      expect(policy_numbers).to be_an(Array)
      expect(policy_numbers).not_to be_empty
      expect(policy_numbers).to include('123456789')
    end
  end

  describe '#calculate_checksum' do
    it 'returns true for a valid policy number' do
      ocr_parser = OCRParser.new(user_story1)

      expect(OCRUtils.calculate_checksum('123456789')).to be(true)
    end

    it 'returns false for an invalid policy number' do
      ocr_parser = OCRParser.new(user_story1)

      expect(OCRUtils.calculate_checksum('123456788')).to be(false)
    end
  end
end
