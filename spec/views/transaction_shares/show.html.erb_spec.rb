require 'spec_helper'

describe "transaction_shares/show" do
  before(:each) do
    @transaction_share = assign(:transaction_share, stub_model(TransactionShare,
      :transaction_id => 1,
      :user_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
