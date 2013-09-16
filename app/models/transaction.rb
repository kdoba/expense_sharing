class Transaction < ActiveRecord::Base
  belongs_to :user
  has_many :transaction_shares

  def share_with=(new_user)
    if (new_user.is_a? Integer)
      if (User.exists? new_user)
        newTransactionShare = TransactionShare.new(transaction_id: self.id, user_id: new_user)
        newTransactionShare.save
      end
    elsif (new_user.is_a? String)
      user = User.find_by_username(new_user.strip)
      if (user != nil)
        newTransactionShare = TransactionShare.new(transaction_id: self.id, user_id: user.id)
        newTransactionShare.save
      end
    end
  end
  def share_with
    TransactionShare.find_by_transaction_id(id)
    #return_string = ""
    #if (result != nil)
    #  result.each do |each_result|
    #    return_string += each_result.user_id + ","
    #  end
    #end
    #return_string = return_string[0..-1]
    #return_string
  end
end
