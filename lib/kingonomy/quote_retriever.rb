require 'kingonomy/http_request'
require 'kingonomy/stock'

module Kingonomy
  class QuoteRetriever

    attr_reader :http_request
    private :http_request

    def initialize(http_request = Kingonomy::HttpRequest.new)
      @http_request = http_request
    end

    def get_quotes(stocks, fundamentals = [])
      stock_quotes = http_request.request_quotes(stocks, fundamentals)
      default_fundamentals = fundamentals.inject({}) { |hash, key| hash[key] = 0; hash}
      stocks = []
      stock_quotes.each do |quote|
        stocks << Kingonomy::Stock.new(default_fundamentals.merge(quote))
      end
      stocks
    end

  end
end
