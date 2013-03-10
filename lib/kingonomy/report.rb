require 'ruport'

module Kingonomy
  class Report
    
    attr_reader :stocks

    def initialize(stocks)
      @stocks = stocks
    end

    def create_report_table(stocks, fields)
      table = Table(fields)
      stocks.each do |stock|
        table << stock.fields
      end
      table
    end

  end
end
