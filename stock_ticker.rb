require 'open-uri'
require 'json'

puts "What stock do you want to look up?"
symbol = gets.chomp

url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=#{symbol}&interval=1min&apikey=2CKLHCWQ0HB7X8NX"
api_call = open(url)
serialized = File.read(api_call)
stock_json = JSON.parse(serialized)
stock_json2 = stock_json["Time Series (1min)"].first
stock_keys = stock_json2[1].keys
puts "Symbol: #{stock_json["Meta Data"]["2. Symbol"]}"
puts "1min open: #{stock_json2[1][stock_keys[0]]}"
