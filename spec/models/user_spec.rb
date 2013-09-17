require 'spec_helper'

describe User do
  it "should require a username" do
    User.new(:username => "").should_not be_valid
  end

  it "should require an email" do
    User.new(:email => "").should_not be_valid
  end
end
