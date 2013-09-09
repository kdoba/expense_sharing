class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :transaction_shares

  def share_with=(new_user_id)
     newTransactionShare = TransactionShare.new(transaction_id: id, user_id: new_user_id)
     newTransactionShare.save
  end
  def share_with
    result = TransactionShare.find_by_transaction_id(id)
    if (result != nil)
      result.email
    end
  end
end
