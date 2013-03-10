# Kingonomy

In progess...

Library and DSL for interacting with the TradeKing API.

## Installation

Add this line to your application's Gemfile:

    gem 'kingonomy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kingonomy

## Usage

DSL:
    Example - spec/integration/dsl_test.rb
    
    stock_report do
      stocks :ATVI, :APOL, :AAPL, :AGX, :CPLA, :CSCO, :GME, :GTIV, :GTAT, :HLF, :INTX, :ESI, :LPS, :MSFT, :NATR, :NSU, :NTI, :NOC, :NUS, :PDLI, :POZN, :QCOR, :RTN, :RPXC, :STX, :TNAV, :USMO, :EGY, :VG, :WCRX
      fundamentals :symbol, :name, :pe, :eps, :iad, :yield, :divfreq, :prbook, :bid, :wk52lo, :wk52hi                          
      sort { |a, b| b.yield <=> a.yield }                                                                                      
      sort { |a, b| (b.bid - b.wk52lo)  <=> (a.bid - a.wk52lo) }                                                               
      sort { |a, b| (b.wk52hi - b.bid)  <=> (a.wk52hi - a.bid) }                                                               
      filter { |stock| stock[:yield] > 2 }                                                                                     
      filter { |stock| stock[:pe] < 15 }
    end

   Run example from the command line:
    
    user-prompt$ kingonomy 
     
   Run your own file from the command line:

    user-prompt$ kingonomy <your_file.rb>
    
Library:
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
