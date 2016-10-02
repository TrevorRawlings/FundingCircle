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