require_relative '../spec_helper'

describe PrimeNumbers::BasicPrimeGenerator do
  describe 'is_prime?' do
    it 'returns false when given a negative number' do
      (-20..-1).each do |number|
        expect(PrimeNumbers::BasicPrimeGenerator.is_prime? number).to be false
      end
    end

    it 'returns true when given prime numbers' do
      PRIME_NUMBERS.each do |number|
        expect(PrimeNumbers::BasicPrimeGenerator.is_prime? number).to be true
      end
    end

    it 'returns false when given positive numbers that are not prime' do
      (0..70).to_a - PRIME_NUMBERS.each do |number|
        expect(PrimeNumbers::BasicPrimeGenerator.is_prime? number).to be true
      end
    end
  end

  describe 'generate' do
    it 'should generate the requested number of primes' do
      expect(PrimeNumbers::BasicPrimeGenerator.generate 5).to eq PRIME_NUMBERS.first(5)
      expect(PrimeNumbers::BasicPrimeGenerator.generate 10).to eq PRIME_NUMBERS.first(10)
    end
  end
end