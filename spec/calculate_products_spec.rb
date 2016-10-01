require_relative 'spec_helper'

describe FundingCircle::ProductsTable do
  describe 'initializer' do
    it 'constructs a table that is n+1 by n+1 when given an array of length n' do
      products = FundingCircle::ProductsTable.new([1, 2, 3])
      expect(products.row_count).to eq 4
      expect(products.column_count).to eq 4
    end

    it 'populates the first row with the supplied values' do
      products = FundingCircle::ProductsTable.new([10, 20, 30])
      expect(products[0, 1]).to eq 10
      expect(products[0, 2]).to eq 20
      expect(products[0, 3]).to eq 30
    end

    it 'populates the first column with the supplied values' do
      products = FundingCircle::ProductsTable.new([10, 20, 30])
      expect(products[1, 0]).to eq 10
      expect(products[2, 0]).to eq 20
      expect(products[3, 0]).to eq 30
    end

    it 'leaves the top left cell empty' do
      products = FundingCircle::ProductsTable.new([10, 20, 30])
      expect(products[0, 0]).to be_nil
    end

    it 'calculates the products' do
      products = FundingCircle::ProductsTable.new([1, 2, 3])
      expect(products.table).to eql [[nil, 1, 2, 3],
                                     [  1, 1, 2, 3],
                                     [  2, 2, 4, 6],
                                     [  3, 3, 6, 9]]
    end
  end
end