Feature: Stock Quote
	In order to understand a company's history
	As an investor
	I want to know the fundamentals of a stock

	Scenario:
		Given I have entered a stock symbol "AAPL"
		When I enter "quote"
		Then the fundamentals should be displayed on the screen
