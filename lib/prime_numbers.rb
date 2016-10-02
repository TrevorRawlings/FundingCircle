require_relative 'generators/simple_prime_generator.rb'
require_relative 'generators/sieve_of_eratosthenes.rb'
require_relative 'products_table.rb'
require_relative 'format_table.rb'

module PrimeNumbers
  def self.generate_table(size, output = $stdout)
    primes = PrimeNumbers::SieveOfEratosthenes.generate(size)
    products = ProductsTable.new(primes)
    FormatTable.to_ascii(products, output)
  end
end