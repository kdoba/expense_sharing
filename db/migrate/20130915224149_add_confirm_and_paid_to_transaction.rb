class AddConfirmAndPaidToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :confirm, :boolean, default: false
    add_column :transactions, :paid, :boolean, default: false
  end
end
