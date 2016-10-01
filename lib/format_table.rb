module FundingCircle
  class FormatTable
    NEW_LINE = "\n"

    class << self
      # This is so simple that is probably doesn't need to be in its own class. I've separated it from
      # ProductsTable because a real application is likely to also want other types of formatter (e.g.
      # csv or HTML) in which case pulling them out would make sense
      #
      def to_ascii(table, output = '')
        # The largest value will always be in the bottom right hand corner so this step is unesssicary but
        # I'm not expecting it add a significant runtime overhead and leaving the calculation here results
        # in the method being a little more generic
        #
        largest_value = table.map{ |row| row.compact.max }.max
        column_width = largest_value.to_s.length + 1

        table.each_row do |row|
          row.each do |column|
            output << column.to_s.ljust(column_width)
          end
          output << NEW_LINE
        end
        output
      end
    end
  end
end
