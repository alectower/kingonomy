require 'kingonomy/quote_retriever'
require 'kingonomy/report'
require 'kingonomy/dsl'

module Kingonomy
  class DSLRunner
    include Kingonomy::DSL
    
    def initialize(file)
      @sort_blocks = []
      @filter_blocks = []
      instance_eval File.read(file), file, 1
    end
    
    def stock_report(&block)
      block.call
    end

    def get_quote_report
      stock_quotes = fetch_stock_quotes
      sort_stocks(stock_quotes)
      table = create_stock_report(stock_quotes)
      filter_stocks(table)
      table
    end

    def fetch_stock_quotes
      quote_retriever = Kingonomy::QuoteRetriever.new
      quote_retriever.get_quotes(@stocks, @fundamentals)
    end

    def sort_stocks(stock_quotes)
      @sort_blocks.each do |block|
        stock_quotes.sort!(&block)
      end
    end

    def create_stock_report(stock_quotes)
      report = Kingonomy::Report.new(stock_quotes)
      report.create_report_table(stock_quotes, @fundamentals)
    end

    def filter_stocks(table)
      @filter_blocks.each do |block|
        table.sub_table!(&block)
      end
    end
  end

end
