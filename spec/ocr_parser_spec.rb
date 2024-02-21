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

  describe '#parse_digit' do
    it 'parses a valid digit' do
      ocr_parser = OCRParser.new(user_story1)

      expect(ocr_parser.parse_digit(' _ | ||_|')).to eq('0')
      expect(ocr_parser.parse_digit('     |  |')).to eq('1')
      expect(ocr_parser.parse_digit(' _  _||_ ')).to eq('2')
      expect(ocr_parser.parse_digit(' _  _| _|')).to eq('3')
      expect(ocr_parser.parse_digit('   |_|  |')).to eq('4')
      expect(ocr_parser.parse_digit(' _ |_  _|')).to eq('5')
      expect(ocr_parser.parse_digit(' _ |_ |_|')).to eq('6')
      expect(ocr_parser.parse_digit(' _   |  |')).to eq('7')
      expect(ocr_parser.parse_digit(' _ |_||_|')).to eq('8')
      expect(ocr_parser.parse_digit(' _|_| _|')).to eq('9')
    end

    it 'returns "?" for an unknown or invalid digit' do
      ocr_parser = OCRParser.new(user_story1)

      expect(ocr_parser.parse_digit('   |   |')).to eq('?')
      expect(ocr_parser.parse_digit(' _ |   | ')).to eq('?')
      expect(ocr_parser.parse_digit(' _ | | | ')).to eq('?')
    end

  end
end
