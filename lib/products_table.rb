require 'forwardable.rb'

module PrimeNumbers
  class ProductsTable
    include Enumerable
    extend  Forwardable

    attr_reader    :table
    def_delegators :@table, :each, :flatten, :count

    def initialize(values)
      @table = Array.new(values.size + 1) do
        Array.new(values.size + 1)
      end
      values.each_with_index do |value, index|
        self[0, index + 1]= value
        self[index + 1, 0]= value
      end
      calculate_products values
    end

    alias each_row            each
    alias each_row_with_index each_with_index

    alias row_count    count
    alias column_count count
    
    def [](row, column)
      @table[row][column]
    end

    private

    def []=(row, column, value)
      @table[row][column]= value
    end

    def set_product(i, j, value)
      self[i + 1, j + 1]= value
      self[j + 1, i + 1]= value
    end

    def calculate_products(values)
      (0...values.length).each do |i|
        (0..i).each do |j|
          set_product(i, j, values[i] * values[j])
        end
      end
    end
  end
end

