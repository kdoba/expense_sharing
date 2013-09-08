require 'spec_helper'

describe "transactions/show" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :date => "Date",
      :description => "Description",
      :amount => "9.99",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Date/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
