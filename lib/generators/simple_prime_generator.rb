module PrimeNumbers
  class SimplePrimeGenerator
    class << self
      def is_prime?(number)
        return false if number <= 1

        (2...number).none? do |divisor|
          number % divisor == 0
        end
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