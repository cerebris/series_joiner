module SeriesJoiner
  module ArrayAdditions
    # Joins items in an array together in a grammatically correct manner.
    #
    # Options:
    # * `delimiter` - inserted between items, except for the final two (default: ', ')
    # * `final_delimiter` - inserted between the final two items (if > 2), but before the conjunction (default: '')
    # * `conjunction` - inserted between the final two items (default: ' and ')
    def join_as_series(options = {})
      if defined?(I18n)
        default_delimiter       = I18n.translate(:'series_joiner.default_delimiter',       :locale => options[:locale])
        default_final_delimiter = I18n.translate(:'series_joiner.default_final_delimiter', :locale => options[:locale])
        default_conjunction     = I18n.translate(:'series_joiner.default_conjunction',     :locale => options[:locale])
      else
        default_delimiter       = ', '
        default_final_delimiter = ''
        default_conjunction     = ' and '
      end

      delimiter = options[:delimiter] || default_delimiter
      final_delimiter = options[:final_delimiter] || default_final_delimiter
      conjunction = options[:conjunction] || default_conjunction

      sz = self.size
      if sz > 0
        r = self[0]
        if sz > 1
          if sz > 2
            for i in 1..(sz - 2)
              r += delimiter + self[i]
            end
            r += final_delimiter
          end
          r += conjunction + self[sz - 1]
        end
      end
      return r
    end
  end
end