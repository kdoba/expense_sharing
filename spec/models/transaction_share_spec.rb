require 'spec_helper'

describe TransactionShare do
  it "should require both transaction_id and user_id" do
    TransactionShare.new(:transaction_id => "").should_not be_valid
    TransactionShare.new(:user_id => "").should_not be_valid
  end
end
