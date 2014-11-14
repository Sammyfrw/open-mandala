json.array!(@tickers) do |ticker|
  json.extract! ticker, :id, :ticker_type_id, :ticker, :name
  json.url ticker_url(ticker, format: :json)
end
