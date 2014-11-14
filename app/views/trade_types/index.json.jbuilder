json.array!(@trade_types) do |trade_type|
  json.extract! trade_type, :id, :type_id, :group, :symbol_name, :description, :deposit_description, :withdrawal_description
  json.url trade_type_url(trade_type, format: :json)
end
