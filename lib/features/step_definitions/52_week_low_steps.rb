lib = File.expand_path('../../../', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Given /^I have entered a list of stock symbols "(.*?)"$/ do |symbols|
	@symbols = symbols.split(",")
end

When /^I enter fifty two week low "(.*?)"$/ do |method|
	@retriever = KingClient::StockRetriever.new
	@lows = @retriever.send method, @symbols
end

Then /^the companies will displayed in order based on smallest difference between current price and fifty two week low$/ do 
	puts @lows
end
