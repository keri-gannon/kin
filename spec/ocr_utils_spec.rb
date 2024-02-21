require_relative '../lib/ocr_utils'

describe OCRUtils do
  describe '#parse_digit' do
    it 'parses a valid digit' do
      expect(OCRUtils.parse_digit(' _ | ||_|')).to eq('0')
      expect(OCRUtils.parse_digit('     |  |')).to eq('1')
      expect(OCRUtils.parse_digit(' _  _||_ ')).to eq('2')
      expect(OCRUtils.parse_digit(' _  _| _|')).to eq('3')
      expect(OCRUtils.parse_digit('   |_|  |')).to eq('4')
      expect(OCRUtils.parse_digit(' _ |_  _|')).to eq('5')
      expect(OCRUtils.parse_digit(' _ |_ |_|')).to eq('6')
      expect(OCRUtils.parse_digit(' _   |  |')).to eq('7')
      expect(OCRUtils.parse_digit(' _ |_||_|')).to eq('8')
      expect(OCRUtils.parse_digit(' _|_| _|')).to eq('9')
    end

    it 'returns "?" for an unknown or invalid digit' do
      expect(OCRUtils.parse_digit('   |   |')).to eq('?')
      expect(OCRUtils.parse_digit(' _ |   | ')).to eq('?')
      expect(OCRUtils.parse_digit(' _ | | | ')).to eq('?')
    end
  end
end
