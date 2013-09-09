require 'spec_helper'

describe "transaction_shares/edit" do
  before(:each) do
    @transaction_share = assign(:transaction_share, stub_model(TransactionShare,
      :transaction_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit transaction_share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_share_path(@transaction_share), "post" do
      assert_select "input#transaction_share_transaction_id[name=?]", "transaction_share[transaction_id]"
      assert_select "input#transaction_share_user_id[name=?]", "transaction_share[user_id]"
    end
  end
end
