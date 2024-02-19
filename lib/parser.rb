class Parser
  def initialize
    @file_path = file_path
  end
end

# Kin has just recently purchased an ingenious machine to assist in reading policy
# report documents. The machine scans the paper documents for policy numbers,
# and produces a file with a number of entries which each look like this:
# _ _ _ _ _ _ _
# | _| _||_||_ |_ ||_||_|
# ||_ _| | _||_| ||_| _|
# Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each
# entry contain a policy number written using pipes and underscores, and the fourth
# line is blank. Each policy number should have 9 digits, all of which should be in the
# range 0-9. A normal file contains around 500 entries.
# Your first task is to write a program that can take this file and parse it into actual
# numbers.