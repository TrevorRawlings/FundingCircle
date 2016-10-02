require_relative 'spec_helper'

describe PrimeNumbers do
  it 'renders to a table containing the product of the prime numbers when generate_table is invoked' do
    output = PrimeNumbers.generate_table(3, '')
    table = parse_ascii_table(output)
    expect(table).to eql [['',  '2',  '3',  '5'],
                          ['2', '4',  '6',  '10'],
                          ['3', '6',  '9',  '15'],
                          ['5', '10', '15', '25']]
  end
end
