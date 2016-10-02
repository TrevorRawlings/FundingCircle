module PrimeNumbers
  class SieveOfEratosthenes
    class << self
      def generate(count)
        prime_numbers = sieve(estimate_n_th_prime count)
        if prime_numbers.count < count
          raise "Expected sieve to have found at least #{count} prime numbers"
        end
        prime_numbers.first(count)
      end

      # Method is public to make testing easier. An alternative would be to leave it private but then use
      # SieveOfEratosthenes.send(:rossers_theorem, n) to call it from the rspec test
      def rossers_theorem(n)
        n * (Math.log(n) + Math.log( Math.log( n ) ))
      end

      private

      # Wikipedia lists lots of ways of estimating the size of the nth prime number.
      # https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations%5Ffor%5Fthe%5Fnth%5Fprime%5Fnumber
      #
      # A more accurate estimate prevents the sieve from doing unnecessary work but complicates the code and
      # the runtime overhead of more complex estimation logic also needs to be considered.
      #
      # I've implemented the relatively simple Rosser's theorem but this stackoverflow post lists alternatives:
      # http://stackoverflow.com/a/1069023
      #
      def estimate_n_th_prime(n)
         return 13 if n < 6
         rossers_theorem(n).ceil
      end

      def sieve(largest_number)
        values = (2..largest_number).to_a
        values.each_with_index do |value, i|
          next unless value
          (i + value...largest_number).step(value).each do |item_to_exclude|
            values[item_to_exclude] = nil
          end
        end
        values.compact
      end
    end
  end
end