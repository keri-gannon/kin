module OCRUtils
  def self.parse_digit(digit_str)
    digit_map = {
      ' _ | ||_|' => '0',
      '     |  |' => '1',
      ' _  _||_ ' => '2',
      ' _  _| _|' => '3',
      '   |_|  |' => '4',
      ' _ |_  _|' => '5',
      ' _ |_ |_|' => '6',
      ' _   |  |' => '7',
      ' _ |_||_|' => '8',
      ' _|_| _|' => '9',
    }
    digit_map[digit_str] || '?'
  end

  def self.calculate_checksum(policy_number)
    # split the policy number into digits, reverse it, and multiply each digit by its position
    digits = policy_number.split('').map(&:to_i)
    checksum = digits.reverse.map.with_index { |d, i| (i + 1) * d }.sum % 11
    checksum == 0
  end
end