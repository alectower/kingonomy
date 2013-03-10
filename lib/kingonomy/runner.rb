require 'kingonomy/quote_retriever'
require 'kingonomy/report'
require 'kingonomy/dsl'

module Kingonomy
  class Runner
    include Kingonomy::DSL
    
    def initialize(file)
      instance_eval File.read(file), file, 1
      print_quote_report
    end

    def print_quote_report
      quote_retriever = Kingonomy::QuoteRetriever.new
      stock_quotes = quote_retriever.get_quotes(@stocks, @fundamentals)
      @sort_blocks.each do |block|
        stock_quotes.sort!(&block)
      end
      report = Kingonomy::Report.new(stock_quotes)
      table = report.create_report_table(stock_quotes, @fundamentals)
      @filter_blocks.each do |block|
        table.sub_table!(&block)
      end
      p table
    end
  end
end
