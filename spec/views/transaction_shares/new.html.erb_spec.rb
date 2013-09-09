require 'spec_helper'

describe "transaction_shares/new" do
  before(:each) do
    assign(:transaction_share, stub_model(TransactionShare,
      :transaction_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new transaction_share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_shares_path, "post" do
      assert_select "input#transaction_share_transaction_id[name=?]", "transaction_share[transaction_id]"
      assert_select "input#transaction_share_user_id[name=?]", "transaction_share[user_id]"
    end
  end
end
