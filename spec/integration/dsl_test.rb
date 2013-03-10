stock_report do
  stocks :ATVI, :APOL, :AAPL, :AGX, :CPLA, :CSCO, :GME, :GTIV, :GTAT, :HLF, :INTX, :ESI, :LPS, :MSFT, :NATR, :NSU, :NTI, :NOC, :NUS, :PDLI, :POZN, :QCOR, :RTN, :RPXC, :STX, :TNAV, :USMO, :EGY, :VG, :WCRX
  fundamentals :symbol, :name, :pe, :eps, :iad, :yield, :divfreq, :prbook, :bid, :wk52lo, :wk52hi                          
  sort { |a, b| b.yield <=> a.yield }                                                                                      
  sort { |a, b| (b.bid - b.wk52lo)  <=> (a.bid - a.wk52lo) }                                                               
  sort { |a, b| (b.wk52hi - b.bid)  <=> (a.wk52hi - a.bid) }                                                               
  filter { |stock| stock[:yield] > 2 }                                                                                     
  filter { |stock| stock[:pe] < 15 }
end
