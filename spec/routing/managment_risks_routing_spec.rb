require "rails_helper"

RSpec.describe ManagmentRisksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/managment_risks").to route_to("managment_risks#index")
    end

    it "routes to #new" do
      expect(:get => "/managment_risks/new").to route_to("managment_risks#new")
    end

    it "routes to #show" do
      expect(:get => "/managment_risks/1").to route_to("managment_risks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/managment_risks/1/edit").to route_to("managment_risks#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/managment_risks").to route_to("managment_risks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/managment_risks/1").to route_to("managment_risks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/managment_risks/1").to route_to("managment_risks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/managment_risks/1").to route_to("managment_risks#destroy", :id => "1")
    end
  end
end
