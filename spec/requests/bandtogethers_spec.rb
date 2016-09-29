require 'rails_helper'

RSpec.describe "Bandtogethers", type: :request do
  describe "GET /bandtogethers" do
    it "works! (now write some real specs)" do
      get bandtogethers_path
      expect(response).to have_http_status(200)
    end
  end
end
