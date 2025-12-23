require 'rails_helper'

RSpec.describe "Timers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/timer/index"
      expect(response).to have_http_status(:success)
    end
  end
end
