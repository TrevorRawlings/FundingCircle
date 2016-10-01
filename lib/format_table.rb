module PrimeNumbers
  class FormatTable
    class << self
      # This is so simple that it probably doesn't need to be in its own class. I've separated it from
      # ProductsTable because in a real application we would probably want to support other types of output
      # (e.g. csv or HTML) and in that case pulling the presentation logic out would make sense.
      #
      def to_ascii(table, output = '')
        # The largest value will always be in the bottom right hand corner so this step is unnecessary. But
        # I'm not expecting it to add a significant runtime overhead and leaving the calculation here results
        # in the formatter being a little more generic
        #
        largest_value = table.flatten.compact.max
        column_width = largest_value.to_s.length + 1

        table.each_row do |row|
          row.each do |column|
            output << column.to_s.ljust(column_width)
          end
          output << "\n"
        end
        output
      end
    end
  end
end
