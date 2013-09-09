class CreateTransactionShares < ActiveRecord::Migration
  def change
    create_table :transaction_shares do |t|
      t.integer :transaction_id
      t.integer :user_id

      t.timestamps
    end
  end
end
