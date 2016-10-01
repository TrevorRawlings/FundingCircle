#!/usr/bin/env ruby
require 'optparse'
require_relative 'lib/prime_numbers.rb'


def main
  options = {:number => 10}

  parser = OptionParser.new do|opts|
    opts.banner = "Usage: app.rb [options]"
    opts.on('-n', '--number number', 'Number of prime numbers') do |number|
      options[:number] = number.to_i;
    end
  end

  parser.parse!

  FundingCircle::generate_table(options[:number])
end

main

