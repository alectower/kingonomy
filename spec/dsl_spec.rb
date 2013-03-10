require 'spec_helper'
require 'kingonomy/dsl'

describe Kingonomy::DSL do
  before do
    class TestObject
      include Kingonomy::DSL
    end
  end
  subject(:sub) {TestObject.new}
  context "DSL module included" do
    it "responds to stocks" do
      sub.respond_to?(:stocks).should be_true
    end
    it "responds to fundamentals" do
      sub.respond_to?(:fundamentals).should be_true
    end
    it "responds to filter" do
      sub.respond_to?(:filter).should be_true
    end
    it "responds to sort" do
      sub.respond_to?(:sort).should be_true
    end
  end
  describe ".stocks" do
    it "stores stock symbols" do
      sub.stocks :AAPL, :MSFT, :GRPN
      sub.instance_eval do
        @stocks.should == [:AAPL, :MSFT, :GRPN]
      end
    end
  end
  describe ".fundamentals" do
    it "stores fundamentals" do 
      sub.fundamentals :yield, :bid, :wk52lo, :wk52hi
      sub.instance_eval do
        @fundamentals.should == [:yield, :bid, :wk52lo, :wk52hi]
      end
    end
  end
  describe ".filter" do
    it "saves block for filtering stock results based on fundamentals" do
      test_filter = lambda {:yield > 2 and :bid < 70}
      sub.filter &test_filter      
      sub.instance_eval do
        @filter_blocks.first.should == test_filter
      end
    end
  end
  describe ".sort" do
    it "stores sort blocks" do
      test_sort = lambda {|a,b| b.yield <=> a.yield }
      sub.sort &test_sort      
      sub.instance_eval do
        @sort_blocks.first.should == test_sort
      end
    end
  end
end
