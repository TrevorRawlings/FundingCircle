require_relative 'spec_helper'

describe PrimeNumbers::FormatTable do
  describe 'to_ascii' do
    # I tend to minimse my use of regex expressions because they can be a little diffiuclt to read
    # but parsing text output seems like a sensible use:
    # * The first digit is optional because the first cell on the top row is empty
    ASCII_ROW = /^(\d*)\s+(\d)\s+(\d)\s+(\d)\s+$/

    let(:products)   { PrimeNumbers::ProductsTable.new([1, 2, 3]) }
    let(:cell_width) { (3 * 3).to_s.length + 1  }

    before :each do
      @lines = PrimeNumbers::FormatTable.to_ascii(products).split("\n")
    end

    it 'writes a line for each row in the table' do
      expect(@lines.length).to eql products.row_count
    end

    it 'adds white space between cell values' do
      @lines.each do |line|
        expect(line).to match ASCII_ROW
      end
    end

    it 'renders the correct values into each cell' do
      @lines.each_with_index do |line, row|
        match = ASCII_ROW.match(line)
        expected_row_values = products.table[row].map(&:to_s)
        expect(match[1..4]).to eql expected_row_values
      end
    end

    it 'should pad the cell values with white space so that reach row is the same length' do
      expected_length = cell_width * products.column_count
      @lines.each do |line|
        expect(line.length).to eql expected_length
      end
    end
  end
end