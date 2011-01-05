module SeriesJoiner
  # join_as_series - join items in an array together in a grammatically correct manner
  #
  # options:
  #   :delimiter       => inserted between items, except for the final two (default => ',')
  #   :final_delimiter => inserted between the final two items (if > 2), but before the conjunction (default => '')
  #   :conjunction     => inserted between the final two items (default => 'and')
  #   :padding         => inserted after delimiters, as well as before and after conjunctions (default => ' ')
  #
  def join_as_series(options = {})
    padding = options[:padding] || ' '
    delimiter = options[:delimiter] || ','
    final_delimiter = options[:final_delimiter] || ''
    conjunction = options[:conjunction] || 'and'

    sz = self.size
    if sz > 0
      r = self[0]
      if sz > 1
        if sz > 2
          for i in 1..(sz - 2)
            r += delimiter + padding + self[i]
          end
          r += final_delimiter
        end
        r += padding + conjunction + padding + self[sz - 1]
      end
    end
    return r
  end
end

class Array
  include SeriesJoiner
end