require 'spec_helper'

describe SeriesJoiner do
  describe "using default options" do
    it "should join an empty array as nil" do
      [].join_as_series.should eq nil
    end
    it "should join an array of one item" do
      ['a'].join_as_series.should eq 'a'
    end
    it "should join an array of two items" do
      ['a', 'b'].join_as_series.should eq 'a and b'
    end
    it "should join an array of three items" do
      ['a', 'b', 'c'].join_as_series.should eq 'a, b and c'
    end
    it "should join an array of four items" do
      ['a', 'b', 'c', 'd'].join_as_series.should eq 'a, b, c and d'
    end
  end
  
  describe "using an 'or' conjunction" do
    let(:options) { {:conjunction => ' or '} }
    
    it "should join an array of one item" do
      ['a'].join_as_series(options).should eq 'a'
    end
    it "should join an array of two items" do
      ['a', 'b'].join_as_series(options).should eq 'a or b'
    end
    it "should join an array of three items" do
      ['a', 'b', 'c'].join_as_series(options).should eq 'a, b or c'
    end
    it "should join an array of four items" do
      ['a', 'b', 'c', 'd'].join_as_series(options).should eq 'a, b, c or d'
    end
  end

  describe "using a ';' delimiter" do
    let(:options) { {:delimiter => '; '} }
    
    it "should join an array of one item" do
      ['a'].join_as_series(options).should eq 'a'
    end
    it "should join an array of two items" do
      ['a', 'b'].join_as_series(options).should eq 'a and b'
    end
    it "should join an array of three items" do
      ['a', 'b', 'c'].join_as_series(options).should eq 'a; b and c'
    end
    it "should join an array of four items" do
      ['a', 'b', 'c', 'd'].join_as_series(options).should eq 'a; b; c and d'
    end
  end

  describe "using a ';' delimiter properly" do
    let(:options) { {:delimiter => '; ', :conjunction => '; or, '} }
    
    it "should join an array of one item" do
      ['a'].join_as_series(options).should eq 'a'
    end
    it "should join an array of two items" do
      ['a', 'b'].join_as_series(options).should eq 'a; or, b'
    end
    it "should join an array of three items" do
      ['a', 'b', 'c'].join_as_series(options).should eq 'a; b; or, c'
    end
    it "should join an array of four items" do
      ['a', 'b', 'c', 'd'].join_as_series(options).should eq 'a; b; c; or, d'
    end
  end

  describe "using a ',' final delimiter" do
    let(:options) { {:final_delimiter => ','} }

    it "should join an array of one item" do
      ['a'].join_as_series(options).should eq 'a'
    end
    it "should join an array of two items" do
      ['a', 'b'].join_as_series(options).should eq 'a and b'
    end
    it "should join an array of three items" do
      ['a', 'b', 'c'].join_as_series(options).should eq 'a, b, and c'
    end
    it "should join an array of four items" do
      ['a', 'b', 'c', 'd'].join_as_series(options).should eq 'a, b, c, and d'
    end
  end
end