#!/usr/bin/env ruby
require 'optparse'
require_relative 'lib/prime_numbers.rb'

def parse_options
  options = { :size => 10 }

  parser = OptionParser.new do|opts|
    opts.banner = 'Usage: prime_numbers.rb [options]'
    opts.on('-s', '--size number', 'Size of the table') do |number|
      options[:size] = number.to_i;
    end
  end
  parser.parse!
  options
end

def main
  options = parse_options()
  PrimeNumbers::generate_table(options[:size])
end

main