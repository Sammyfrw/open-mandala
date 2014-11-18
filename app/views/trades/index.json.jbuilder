json.array!(@trades) do |trade|
  json.extract! trade, :id, :trade_date, :user_id, :ticker_id, :trade_type_id, :num_units, :price, :parent_id, :withdrawal_id, :deposit_id, :commission, :reg_fee, :strike, :expiration, :description
  json.url trade_url(trade, format: :json)
end
