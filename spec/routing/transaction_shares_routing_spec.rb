require "spec_helper"

describe TransactionSharesController do
  describe "routing" do

    it "routes to #index" do
      get("/transaction_shares").should route_to("transaction_shares#index")
    end

    it "routes to #new" do
      get("/transaction_shares/new").should route_to("transaction_shares#new")
    end

    it "routes to #show" do
      get("/transaction_shares/1").should route_to("transaction_shares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transaction_shares/1/edit").should route_to("transaction_shares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transaction_shares").should route_to("transaction_shares#create")
    end

    it "routes to #update" do
      put("/transaction_shares/1").should route_to("transaction_shares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transaction_shares/1").should route_to("transaction_shares#destroy", :id => "1")
    end

  end
end
