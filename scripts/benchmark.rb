#!/usr/bin/env ruby
require 'benchmark'
require 'optparse'
require_relative '../lib/prime_numbers.rb'


def format_time(time)
  sprintf('%-20.3g', time)
end

def benchmark(generator, repeat)
  puts "Testing the #{generator.name} (each test is repeated #{repeat} times)\n\n"

  puts ' ' * 25 + 'total test time'.ljust(20) + 'time taken find each prime number'
  [10, 50, 100, 500].each do |sequence_length|
    time = Benchmark.realtime do
      repeat.times do
        generator.generate sequence_length
      end
    end

    time_for_each_prime_number = time/(sequence_length + repeat)
    puts "first #{sequence_length} prime numbers".ljust(25) + format_time(time) + format_time(time_for_each_prime_number)
  end
  puts ''
end

def main()
  options = { :iterations => 100 }

  parser = OptionParser.new do|opts|
    opts.banner = "Usage: ruby benchmark.rb [options]"
    opts.on('-i', '--iterations number', 'Number of times to repeat each test') do |number|
      options[:iterations] = number.to_i;
    end
  end
  parser.parse!

  benchmark(PrimeNumbers::SimplePrimeGenerator, options[:iterations])
  benchmark(PrimeNumbers::SieveOfEratosthenes, options[:iterations])
end

main()
