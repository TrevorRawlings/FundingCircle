module FundingCircle
  class BasicPrimeGenerator
    class << self
      # A prime number (or a prime) is a natural number greater
      # than 1 that has no positive divisors other than 1 and itself.
      def is_prime?(number)
        return false if number <= 1

        (2...number).each do |divisor|
          return false if number % divisor == 0
        end
        true
      end

      def generate(count)
        result = []
        i = 2
        while result.length < count
          result << i if is_prime? i
          i += 1
        end
        result
      end
    end
  end
end