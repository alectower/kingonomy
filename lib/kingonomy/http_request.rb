require 'json'
require 'yaml'
require 'oauth'

module Kingonomy
  class HttpRequest

    QUOTE_URL = "/v1/market/ext/quotes.json?symbols="

    attr_reader :access_token
    private :access_token

    def initialize
      config = YAML::load_file(File.expand_path('../../../config/api.yml', __FILE__))
      consumer = OAuth::Consumer.new config["consumer_key"], config["consumer_secret"], { :site => 'https://api.tradeking.com' }
      @access_token = OAuth::AccessToken.new consumer, config["access_token"], config["access_token_secret"]
    end
    
    def request_quotes(stocks, fundamentals)
      quotes_hash(make_request(url(stocks, fundamentals)))
    end

    def make_request(url)
      access_token.get(url, 
        {'Accept' => 'application/json'})
    end
    
    def url(stocks, fundamentals)
      url = QUOTE_URL + stocks.join(",") 
      url += "&fids=" + fundamentals.map { |field| field.to_s }.join(",") if !fundamentals.empty?
    end

    def quotes_hash(response)
      JSON(response.body).fetch('response').fetch('quotes').fetch('quote')
    end
  end
end
