require 'kingonomy/fundamentals'

module Kingonomy
  class Stock

    attr_reader :fields

    def initialize(fields = {})
      @fields = keys_to_sym_and_values_to_f(fields)
    end

    def method_missing(method_id, *args)
      if self
        if method_id =~ /=$/
          fields[method_id] = args[0]
        else
          fields[method_id] || fields[method_id] = 0
        end
      end
    end

    def respond_to?(method_id)
      fields[method_id] || super
    end

    private

    def keys_to_sym_and_values_to_f(fields)
      fields.inject({}) do |hash, (k,v)| 
        begin
          value = Float(v)
        rescue
          value = v
        end
        hash[k.to_sym] = value 
	hash 
      end
    end

  end
end
