require_relative 'generators/basic_prime_generator.rb'
require_relative 'products_table.rb'
require_relative 'format_table.rb'

module PrimeNumbers
  def self.generate_table(size = 10, output = $stdout)
    primes = BasicPrimeGenerator.generate(size)
    products = ProductsTable.new(primes)
    FormatTable.to_ascii(products, output)
  end
end