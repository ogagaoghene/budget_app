require 'rails_helper'

RSpec.describe "Pages", type: :request do
  describe "GET /splash_screen" do
    it "returns http success" do
      get "/pages/splash_screen"
      expect(response).to have_http_status(:success)
    end
  end

end
