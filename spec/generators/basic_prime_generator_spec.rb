require_relative '../spec_helper'

describe FundingCircle::BasicPrimeGenerator do
  PRIME_NUMBERS = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71]

  describe 'is_prime?' do
    it 'returns false when given a negative number' do
      (-20..-1).each do |number|
        expect(FundingCircle::BasicPrimeGenerator.is_prime? number).to be false
      end
    end

    it 'returns true when given prime numbers' do
      PRIME_NUMBERS.each do |number|
        expect(FundingCircle::BasicPrimeGenerator.is_prime? number).to be true
      end
    end

    it 'returns false when given positive numbers that are not prime' do
      (0..70).to_a - PRIME_NUMBERS.each do |number|
        expect(FundingCircle::BasicPrimeGenerator.is_prime? number).to be true
      end
    end
  end

  describe 'generate' do
    it 'should generate the requested number of primes' do
      expect(FundingCircle::BasicPrimeGenerator.generate 5).to eq PRIME_NUMBERS.first(5)
      expect(FundingCircle::BasicPrimeGenerator.generate 10).to eq PRIME_NUMBERS.first(10)
    end
  end
end