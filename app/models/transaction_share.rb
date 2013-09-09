class TransactionShare < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :user

  validates :transaction_id, presence: true
  validates :user_id, presence: true

  validates :user_id, :uniqueness => { :scope => :transaction_id }
end
