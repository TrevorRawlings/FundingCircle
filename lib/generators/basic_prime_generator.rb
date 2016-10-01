module FundingCircle
  class BasicPrimeGenerator
    class << self
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