json.array!(@transactions) do |transaction|
  json.extract! transaction, :date, :description, :amount, :user_id
  json.url transaction_url(transaction, format: :json)
end