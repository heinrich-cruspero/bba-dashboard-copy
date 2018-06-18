require "rails_helper"

RSpec.describe CustomIsbnsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/custom_isbns").to route_to("custom_isbns#index")
    end

    it "routes to #new" do
      expect(:get => "/custom_isbns/new").to route_to("custom_isbns#new")
    end

    it "routes to #show" do
      expect(:get => "/custom_isbns/1").to route_to("custom_isbns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/custom_isbns/1/edit").to route_to("custom_isbns#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/custom_isbns").to route_to("custom_isbns#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/custom_isbns/1").to route_to("custom_isbns#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/custom_isbns/1").to route_to("custom_isbns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/custom_isbns/1").to route_to("custom_isbns#destroy", :id => "1")
    end

  end
end
