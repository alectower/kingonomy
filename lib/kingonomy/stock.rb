require 'kingonomy/fundamentals'

module Kingonomy
  class Stock

    attr_reader :fields

    def initialize(fields = {})
      fields = keys_to_symbols(fields)
      @fields = fields
    end

    def method_missing(method_id, *args)
      if self
        if method_id =~ /=$/
          fields[method_id] = args[0]
        else
          fields[method_id]
        end
      end
    end

    def respond_to?(method_id)
      fields[method_id] || super
    end

    private

    def keys_to_symbols(fields)
      fields.inject({}) { |hash, (k,v)| hash[k.to_sym] = v; hash }
    end

  end
end
