# TODO: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes

module PrimeNumbers
  class SieveOfEratosthenes
    class << self
      def generate(count)
        prime_numbers = sieve(estimate_n_th_prime count)
        #TODO throw an error id prime_numbers.count < count?

        prime_numbers.first(count)
      end

      # Exposed to make testing easier
      def rossers_theorem(n)
        n * (Math.log(n) + Math.log( Math.log( n ) ))
      end

      private

      # The accurate estimate given
      # Based largely on this stackover flow discussion: http://stackoverflow.com/a/1069023
      # https://en.wikipedia.org/wiki/Prime_number_theorem#Approximations%5Ffor%5Fthe%5Fnth%5Fprime%5Fnumber
      # When the accurate e
      #
      # Lots of possible ways to make the estimte more accurate, although the this
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