module FundingCircle
  class FormatTable
    NEW_LINE = "\n"

    class << self

      # This is so simple that is probably doesn't need to be in its own
      # class. I've separated it from ProductsTable because a real application is likely to also
      # want other types of formatter (e.g. csv or HTML) in which case pulling them out would make sense
      #
      def to_ascii(table, column_width = 5, output = $stdout)
        table.each_row do |row|
          row.each do |column|
            output << column.to_s.ljust(column_width)
          end
          output << NEW_LINE
        end
      end
    end
  end
end
