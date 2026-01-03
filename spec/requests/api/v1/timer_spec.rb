require 'rails_helper'

RSpec.describe "Api::V1::Timers", type: :request do
  let(:user) { create(:user) }

  let(:headers) do
    {
      "Authorization" => "Bearer #{user.auth_token}"
    }
  end

  describe 'GET /timers' do
    it "returns a successful response with an id" do
      get "/api/v1/timers", headers: headers

      expect(response).to have_http_status(:ok)

      answer = JSON.parse(response.body)
      expect(answer[0]).to have_key("id")
      expect(answer[0]["id"]).to be_an(Integer)
    end
  end

  describe 'POST /timers' do
    it "return current id timer was already added" do
      post "/api/v1/timers", headers: headers

      expect(response).to have_http_status(:created)

      answer = JSON.parse(response.body)

      expect(answer).to have_key("id")
      expect(answer["id"]).to be_an(Integer)
    end
  end

  describe 'PUT /timers' do
    it "return no_content code when we execute route with a valid id of timer" do
      put "/api/v1/timers/1", headers: headers
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'DELETE /timers' do
    it "return a id already deleted on database" do
      delete "/api/v1/timers/1", headers: headers
      expect(response).to have_http_status(:ok)

      answer = JSON.parse(response.body)

      expect(answer).to have_key("id")
      expect(answer["id"]).to eq("1")
    end
  end
end
