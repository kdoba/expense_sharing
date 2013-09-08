class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :date
      t.string :description
      t.decimal :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
