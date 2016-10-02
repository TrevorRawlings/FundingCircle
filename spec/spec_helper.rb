begin
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
rescue LoadError
  # bundle install of the codeclimate-test-reporter gem was failing on ruby 1.9.3
  #
  # https://travis-ci.org/TrevorRawlings/FundingCircle/jobs/164352072
  puts 'Unable to load the codeclimate-test-reporter gem'
end

require 'prime_numbers'

PRIME_NUMBERS = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]