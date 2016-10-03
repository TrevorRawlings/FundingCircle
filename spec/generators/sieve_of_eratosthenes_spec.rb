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
      expect( described_class.rossers_theorem(n).to_i ).to eq expected_value
    end
  end

  it 'should generate the requested number of primes' do
    (0..PRIME_NUMBERS.length).each do |count|
      expect(described_class.generate count).to eq PRIME_NUMBERS.first(count)
    end
  end

  it 'raises an error if rossers_theorem estimates too small a value for the nth prime' do
    described_class.expects(:rossers_theorem).returns(5).once
    expect{
      described_class.generate(10)
    }.to raise_exception "Expected sieve to have found at least 10 prime numbers"
  end
end