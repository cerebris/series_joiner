# SeriesJoiner [![Build Status](https://secure.travis-ci.org/cerebris/series_joiner.png)](http://travis-ci.org/cerebris/series_joiner)

A gem for joining items in arrays together into grammatically correct series, such as "a, b and c". 

SeriesJoiner extends the `Array` class with a `join_as_series()` method which is similar to the built-in `join()` method. However, `join_as_series()` allows for custom delimiters and conjunctions. 

## Installation

Run the following (perhaps as sudo):
```
gem install series_joiner
```

## Bundler Configuration

Add the following to your Gemfile:
```
gem 'series_joiner'
```

## Usage

`join_as_series()` accepts the following options:
```
:delimiter       # inserted between items, except for the final two (default => ', ')
:final_delimiter # inserted between the final two items (if > 2), but before the conjunction (default => '')
:conjunction     # inserted between the final two items (default => ' and ')
```

By default, items are joined as follows:
```
['a'].join_as_series #=> 'a'

['a', 'b'].join_as_series #=> 'a and b'

['a', 'b', 'c'].join_as_series #=> 'a, b and c'

['a', 'b', 'c', 'd'].join_as_series #=> 'a, b, c and d'
```

Here are some examples using custom delimiters and/or conjunctions:
```
['a', 'b', 'c'].join_as_series(:delimiter => '; ') #=> 'a; b and c'

['a', 'b', 'c'].join_as_series(:conjunction => ' or ') #=> 'a, b or c'

['a', 'b', 'c'].join_as_series(:delimiter => '; ', :conjunction => '; or, ') #=> 'a; b; or, c'
```

The use of the serial comma (i.e. the final comma sometimes used before the conjunction) is much debated in grammar circles (http://en.wikipedia.org/wiki/Serial_comma). And who doesn't enjoy a rousing debate about grammar? Don't answer that. Anyway, SeriesJoiner does not use the serial comma by default. If you prefer to use it, just set the `:final_delimiter` option to `','`:
```
['a', 'b', 'c'].join_as_series(:final_delimiter => ',') #=> 'a, b, and c'
```

## I18n Support

If you're using SeriesJoiner in a project with I18n support, include the following translations for your locales:
```
  en:
    series_joiner:
      default_delimiter: ', '
      default_final_delimiter: ''
      default_conjunction: ' and '
```

## Tests

This gem uses rspec for testing. To test:
```
rake spec
```

## Notes

This gem's `join_as_series()` method may be compared with the similar `to_sentence()` method implemented in ActiveSupport  (https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/array/conversions.rb). There are several differences:

 * `to_sentence()` is part of ActiveSupport, while `join_as_series` is independent;
 * `to_sentence()` implements the serial comma (see definition above) by default, while `join_as_series()` does not; and,
 * `to_sentence()` requires two options (`:two_words_connector` and `:last_word_connector`) to override a conjunction, instead of the one (`:conjunction`) required by `join_as_series()`.

== License

Copyright (c) 2011 Cerebris Corporation. This is free software released under the MIT License (see MIT-LICENSE for details).
