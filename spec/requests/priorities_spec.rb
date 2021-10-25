require 'rails_helper'

RSpec.describe "Priorities", type: :request do
  describe "GET /priorities" do
    it "works! (now write some real specs)" do
      get priorities_path
      expect(response).to have_http_status(200)
    end
  end
end
