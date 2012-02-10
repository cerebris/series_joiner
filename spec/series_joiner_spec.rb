require 'helper'

class TestSeriesJoiner < Test::Unit::TestCase
  context "using default options" do
    should "join an empty array as nil" do
      assert_equal nil, [].join_as_series
    end
    should "join an array of one item" do
      assert_equal 'a', ['a'].join_as_series
    end
    should "join an array of two items" do
      assert_equal 'a and b', ['a', 'b'].join_as_series
    end
    should "join an array of three items" do
      assert_equal 'a, b and c', ['a', 'b', 'c'].join_as_series
    end
    should "join an array of four items" do
      assert_equal 'a, b, c and d', ['a', 'b', 'c', 'd'].join_as_series
    end
  end
  
  context "using an 'or' conjunction" do
    setup do
      @options = {:conjunction => ' or '}
    end
    
    should "join an array of one item" do
      assert_equal 'a', ['a'].join_as_series(@options)
    end
    should "join an array of two items" do
      assert_equal 'a or b', ['a', 'b'].join_as_series(@options)
    end
    should "join an array of three items" do
      assert_equal 'a, b or c', ['a', 'b', 'c'].join_as_series(@options)
    end
    should "join an array of four items" do
      assert_equal 'a, b, c or d', ['a', 'b', 'c', 'd'].join_as_series(@options)
    end
  end

  context "using a ';' delimiter" do
    setup do
      @options = {:delimiter => '; '}
    end
    
    should "join an array of one item" do
      assert_equal 'a', ['a'].join_as_series(@options)
    end
    should "join an array of two items" do
      assert_equal 'a and b', ['a', 'b'].join_as_series(@options)
    end
    should "join an array of three items" do
      assert_equal 'a; b and c', ['a', 'b', 'c'].join_as_series(@options)
    end
    should "join an array of four items" do
      assert_equal 'a; b; c and d', ['a', 'b', 'c', 'd'].join_as_series(@options)
    end
  end

  context "using a ';' delimiter properly" do
    setup do
      @options = {:delimiter => '; ', :conjunction => '; or, '}
    end
    
    should "join an array of one item" do
      assert_equal 'a', ['a'].join_as_series(@options)
    end
    should "join an array of two items" do
      assert_equal 'a; or, b', ['a', 'b'].join_as_series(@options)
    end
    should "join an array of three items" do
      assert_equal 'a; b; or, c', ['a', 'b', 'c'].join_as_series(@options)
    end
    should "join an array of four items" do
      assert_equal 'a; b; c; or, d', ['a', 'b', 'c', 'd'].join_as_series(@options)
    end
  end

  context "using a ',' final delimiter" do
    setup do
      @options = {:final_delimiter => ','}
    end
    
    should "join an array of one item" do
      assert_equal 'a', ['a'].join_as_series(@options)
    end
    should "join an array of two items" do
      assert_equal 'a and b', ['a', 'b'].join_as_series(@options)
    end
    should "join an array of three items" do
      assert_equal 'a, b, and c', ['a', 'b', 'c'].join_as_series(@options)
    end
    should "join an array of four items" do
      assert_equal 'a, b, c, and d', ['a', 'b', 'c', 'd'].join_as_series(@options)
    end
  end
end