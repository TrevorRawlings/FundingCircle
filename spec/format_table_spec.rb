require_relative 'spec_helper'

describe PrimeNumbers::FormatTable do
  describe 'to_ascii' do


    let(:products)   { PrimeNumbers::ProductsTable.new([1, 2, 3]) }
    let(:cell_width) { (3 * 3).to_s.length + 1  }

    before :each do
      @output = PrimeNumbers::FormatTable.to_ascii(products)
      @lines = @output.split("\n")
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
      table = parse_ascii_table(@output)
      expected_values = products.map { |row| row.map(&:to_s) }
      expect(table).to eql expected_values
    end

    it 'should pad the cell values with white space so that reach row is the same length' do
      expected_length = cell_width * products.column_count
      @lines.each do |line|
        expect(line.length).to eql expected_length
      end
    end
  end
end