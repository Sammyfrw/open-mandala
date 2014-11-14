# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Tickers

puts "Adding $USD ticker"
#Ticker.create!(:name => 'US Dollars', :ticker => '$USD', :ticker_type_id => 1)
# changed these to find_or_create_by to prevent duplicate inserts if the seed is re-run without clearing the db first
# re: find_or_create_by - seed data is for populating blank applications with initial data so duplicates should not be
# an issue (see http://edgeguides.rubyonrails.org/active_record_migrations.html#migrations-and-seed-data)
Ticker.find_or_create_by!(:name => 'US Dollars', :ticker => '$USD', :ticker_type_id => 1)

#TODO note this is required at app level too...look into this
require "open-uri"

# http://stackoverflow.com/questions/1113422/how-to-bypass-ssl-certificate-verification-in-open-uri
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Adding S&P 500 tickers"
#TODO first line is Symbol,Name,Sector - do not add it! FIX
open("https://raw.github.com/datasets/s-and-p-500-companies/master/data/constituents.csv") do |companies|
  companies.read.each_line do |company|
    ticker, name, industry = company.chomp.split(",")
    #Ticker.create!(:name => name, :ticker => ticker, :ticker_type_id => 2)
    Ticker.find_or_create_by!(:name => name, :ticker => ticker, :ticker_type_id => 2)
  end
end

Ticker.find_by_ticker('Symbol').destroy

#NOTE this is for bringing data over from the old system
#NOTE moved after S&P load in case any of these have been added to the S&P since being added here
puts "Adding DNKN ticker"
#Ticker.create!(:name => 'Dunkin Brands', :ticker => 'DNKN', :ticker_type_id => 2)
Ticker.find_or_create_by!(:name => 'Dunkin Brands', :ticker => 'DNKN', :ticker_type_id => 2)

# Canadian company
puts "Adding BMO ticker"
Ticker.find_or_create_by!(:name => 'Bank of Montreal', :ticker => 'BMO', :ticker_type_id => 2)

puts "Adding SCTY ticker"
Ticker.find_or_create_by!(:name => 'Solar City', :ticker => 'SCTY', :ticker_type_id => 2)

# got kicked out of S&P 500
puts "Adding CLF ticker"
Ticker.find_or_create_by!(:name => 'Cliffs Natural Resources', :ticker => 'CLF', :ticker_type_id => 2)

# Transaction Types

puts "Adding transaction types"
TradeType.create!(:type_id =>  1, :group => 0, :symbol_name => :tt_deposit_money, :description => "deposit money", :deposit_description => "deposit ", :withdrawal_description => "na 1")
TradeType.create!(:type_id =>  2, :group => 0, :symbol_name => :tt_add_shares, :description => "add shares", :deposit_description => "add shares of ", :withdrawal_description => "na 2")
TradeType.create!(:type_id =>  3, :group => 1, :symbol_name => :tt_sell_shares, :description => "sell shares", :deposit_description => "from sale of shares of ", :withdrawal_description => "sell shares of ")
TradeType.create!(:type_id =>  4, :group => 1, :symbol_name => :tt_sell_puts, :description => "sell puts", :deposit_description => "from short put on ", :withdrawal_description => "short put on ")
TradeType.create!(:type_id =>  5, :group => 1, :symbol_name => :tt_sell_calls, :description => "sell calls", :deposit_description => "from short call on ", :withdrawal_description => "short call on ")
TradeType.create!(:type_id =>  6, :group => 2, :symbol_name => :tt_buy_shares, :description => "buy shares", :deposit_description => "buy shares of ", :withdrawal_description => "for purchase of shares of ")
TradeType.create!(:type_id =>  7, :group => 2, :symbol_name => :tt_buy_puts, :description => "buy puts", :deposit_description => "na 7", :withdrawal_description => "for purchase of put on ")
TradeType.create!(:type_id =>  8, :group => 2, :symbol_name => :tt_buy_calls, :description => "buy calls", :deposit_description => "na 8", :withdrawal_description => "for purchase of call on ")
TradeType.create!(:type_id =>  9, :group => 3, :symbol_name => :tt_withdraw_money, :description => "withdraw money", :deposit_description => "na 9", :withdrawal_description => "withdrawal ")
TradeType.create!(:type_id => 10, :group => 3, :symbol_name => :tt_remove_shares, :description => "remove shares", :deposit_description => "na 10", :withdrawal_description => "remove shares of ")
TradeType.create!(:type_id => 11, :group => 4, :symbol_name => :tt_expire, :description => "remove option (expiration)", :deposit_description => "na 11", :withdrawal_description => "na 11")
TradeType.create!(:type_id => 12, :group => 4, :symbol_name => :tt_assign, :description => "remove option (assignment)", :deposit_description => "na 12", :withdrawal_description => "na 12")
TradeType.create!(:type_id => 13, :group => 4, :symbol_name => :tt_exercise, :description => "remove option (exercise)", :deposit_description => "na 13", :withdrawal_description => "na 13")
TradeType.create!(:type_id => 14, :group => 0, :symbol_name => :tt_deposit_dividend, :description => "deposit dividend", :deposit_description => "dividend from ", :withdrawal_description => "na 14")

# Demo User
demo_user = User.create! :username => "demo", :email => "demo@mandala.io", :password => "butterfly_demo"
