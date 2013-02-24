lib = File.expand_path('../../../', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'king_client/stock_retriever'

Given /^I have entered a stock symbol "(.*?)"$/ do |symbol|
	@symbol = symbol
end

When /^I enter "(.*?)"$/ do |method|
	@retriever = KingClient::StockRetriever.new
	@fundamentals = @retriever.send method, [@symbol]
end

Then /^the (.*?) should be displayed on the screen$/ do |result|
	puts @fundamentals
end
