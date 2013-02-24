module Kingonomy
  class StockSorter
    
    def sort(stocks)
      stocks.sort!  do |a, b| 
        div_yield(b) <=> div_yield(a) &&
          fifty_two_week_bid_low_diff(b) <=> fifty_two_week_bid_low_diff(a) &&
            fifty_two_week_high_bid_diff(b) <=> fifty_two_week_high_bid_diff(a)
      end
    end

    def div_yield(stock)
      stock.yield.to_f
    end

    def fifty_two_week_bid_low_diff(stock)
      stock.bid.to_f - stock.wk52lo.to_f
    end

    def fifty_two_week_high_bid_diff(stock)
      stock.wk52hi.to_f - stock.bid.to_f
    end

  end
end
