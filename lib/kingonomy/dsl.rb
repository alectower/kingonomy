module Kingonomy
  module DSL

    def stocks(*symbol_list)
      @stocks ||= []
      @stocks += symbol_list
    end

    def fundamentals(*fundamental_list)
      @fundamentals ||= []
      @fundamentals += fundamental_list
    end

    def filter(&block)
      @filter_blocks ||= []
      @filter_blocks << block
    end

    def sort(&block)
      @sort_blocks ||= []
      @sort_blocks << block
    end

  end
end
