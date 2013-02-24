require 'capybara'
require 'capybara-webkit'
require 'capybara/dsl'
require 'kingonomy/stock'

module Kingonomy
  class SymbolRetriever
    include Capybara::DSL
    Capybara.run_server = false
    Capybara.current_driver = :webkit
    Capybara.app_host = "http://www.magicformulainvesting.com"

    def login
      visit '/Account/LogOn'
      fill_in('Email', :with => 'alectower@gmail.com')
      fill_in('Password', :with => 'o0i9u8y7')
      click_on('login')
    end
    
    def get_stocks
      click_on('stocks')
      find('#tableform')
      tds = page.html.scan(/align=\"center\">[A-Z]*<\/td>/)
      stocks = []
      tds.each do |td|
        stocks << td.scan(/[A-Z]+/)[0]
      end
      stocks
    end

  end
end

