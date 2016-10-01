#!/usr/bin/env ruby
require 'benchmark'
require 'optparse'
require_relative '../lib/prime_numbers.rb'


def format_time(time)
  sprintf('%-20.3g', time)
end

def benchmark(generator, repeat = 100)
  puts "Testing the #{generator.name} (each test is repeated #{repeat} times)\n\n"

  puts ' ' * 25 + "total test time     time taken find each prime number"
  [10, 50, 100, 500].each do |sequence_length|
    time = Benchmark.realtime do |x|
      repeat.times do
        generator.generate sequence_length
      end
    end

    time_for_each_prime_number = time/(sequence_length + repeat)
    puts "first #{sequence_length} prime numbers".ljust(25) + format_time(time) + format_time(time_for_each_prime_number)
  end
end

benchmark(PrimeNumbers::BasicPrimeGenerator)

#
# require 'pry'
# binding.pry
#
# puts 'hello'