require 'spec_helper'

describe Transaction do
  before (:each) do
    @user = User.create!(
        username:                   "TestUser",
        email:                  "user@example.com",
        password:               "password",
        password_confirmation:  "password")

    @user2 = User.create!(
        username:                   "TestUser2",
        email:                  "user2@example.com",
        password:               "password",
        password_confirmation:  "password")

    @transaction = Transaction.new(:date => "2/23/2013", :description => "Test transaction",
                                   :amount => 23.21, :user_id => @user.id)
    @transaction.save
  end

  it "test new valid transaction" do
    @transaction.should be_valid
  end

  it "test share_with field" do
    @transaction.share_with = "TestUser"
    TransactionShare.where(transaction_id: @transaction.id).exists?.should be_true
  end

  it "test share_with 2 formats" do
    @transaction.share_with = "TestUser"
    @transaction.share_with = @user2.id

    TransactionShare.where(transaction_id: @transaction.id).count.should == 2
  end
end
