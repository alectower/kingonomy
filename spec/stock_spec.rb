require 'spec_helper'
require 'king_client/stock'

describe KingClient::Stock do
  context "given fundamentals" do
    let(:stock) { KingClient::Stock.new(
        {
          :wk52lo => "20", 
          :wk52hi => "50",
          :yield => "10"
        }) 
    }  
    it { stock.should respond_to :wk52lo }
    it { stock.should respond_to :wk52hi }
    it { stock.should respond_to :yield }
    it { stock.wk52hi.should == "50" }
    it { stock.yield.should == "10" }
    it { stock.wk52lo.should == "20" }
  end
end
