module FundingCircle
  class ProductsTable
    include Enumerable
    attr_reader :table

    # I don't really understand why ruby Matrixes are not mutable. But since they are and I don't want to
    # monkey patch I'm using an array of array's instead
    def initialize(values)
      @table = Array.new(values.size + 1) { Array.new(values.size + 1) }
      values.each_with_index do |value, index|
        self[0, index + 1]= value
        self[index + 1, 0]= value
      end
      calculate_products values
    end

    def each_row(&block)
      @table.each(&block)
    end
    alias each each_row

    def length
      @table.length
    end

    def []=(row, column, value)
      @table[row][column]= value
    end
    
    def [](row, column)
      @table[row][column]
    end

    def max_product
      @table[self.length-1][self.length-1]
    end

    private

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

