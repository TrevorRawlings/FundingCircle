begin
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
rescue LoadError
  puts 'Unable to load the codeclimate-test-reporter gem'
  # travis ci was unable to bundle install the codeclimate-test-reporter gem on ruby 1.9.3
  # https://travis-ci.org/TrevorRawlings/FundingCircle/jobs/164352072
end

RSpec.configure do |config|
  config.mock_with :mocha
end

require 'prime_numbers'

PRIME_NUMBERS = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]

# I tend to minimise the use of regex expressions because they can be difficult to read
# but this seems like an ok use
# * The first digit is optional because the first cell on the top row is empty
ASCII_ROW = /^(\d*)\s+(\d+)\s+(\d+)\s+(\d+)\s*$/

def parse_ascii_table(ascii)
  ascii.split("\n").map do |line|
    match = ASCII_ROW.match(line)
    if match
      match[1..4]
    end
  end
end