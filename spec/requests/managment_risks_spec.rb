require 'rails_helper'

RSpec.describe "ManagmentRisks", type: :request do
  describe "GET /managment_risks" do
    it "works! (now write some real specs)" do
      get managment_risks_path
      expect(response).to have_http_status(200)
    end
  end
end
