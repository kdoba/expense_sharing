json.array!(@transaction_shares) do |transaction_share|
  json.extract! transaction_share, :transaction_id, :user_id
  json.url transaction_share_url(transaction_share, format: :json)
end