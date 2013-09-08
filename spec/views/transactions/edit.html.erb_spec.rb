require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :date => "MyString",
      :description => "MyString",
      :amount => "9.99",
      :user_id => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do
      assert_select "input#transaction_date[name=?]", "transaction[date]"
      assert_select "input#transaction_description[name=?]", "transaction[description]"
      assert_select "input#transaction_amount[name=?]", "transaction[amount]"
      assert_select "input#transaction_user_id[name=?]", "transaction[user_id]"
    end
  end
end
