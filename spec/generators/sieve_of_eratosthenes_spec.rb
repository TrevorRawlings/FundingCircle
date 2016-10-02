require_relative '../spec_helper'

describe PrimeNumbers::SieveOfEratosthenes do
  it "should correctly calculate Rosser's Theorem" do
    { 10 => 31,
      100 => 613,
      1000 => 8840,
      10000 => 114306,
      100000 => 1395639,
      1000000 => 16441302,
      10000000 => 188980382 }.each_pair do  |n, expected_value|
      expect( PrimeNumbers::SieveOfEratosthenes.rossers_theorem(n).to_i ).to eq expected_value
    end
  end

  it 'should generate the requested number of primes' do
    (0..PRIME_NUMBERS.length).each do |count|
      expect(PrimeNumbers::SieveOfEratosthenes.generate count).to eq PRIME_NUMBERS.first(count)
    end
  end
end