require "rails_helper"

RSpec.describe "GET /api/countries", type: :request do
  context "when the user sign in" do
    let(:headers) { { "Authorization" => "Bearer fake-token" } }
    before do
      stub_authenticated_user
      create(:country)
    end
    it "Returns all countries" do
      get "/api/countries", headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.size).to eq(1)
      expect(response.parsed_body.first["id"]).to eq(Country.last.id)
    end
  end
end
