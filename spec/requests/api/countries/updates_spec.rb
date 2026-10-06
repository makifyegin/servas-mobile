require 'rails_helper'

RSpec.describe "PATCH /api/countries/:id", type: :request do
  context "when the user is an admin" do
    let(:created_country) { create(:country) }
    let(:headers) { { "Authorization" => "Bearer fake-token" } }
    let(:params) do
      { country: { name: 'New Country Name' } }
    end
    before do
      stub_authenticated_user
      create(:role, user_id: "test-user", role: "admin")
    end

    it "responds 200 OK with the updated country" do
      put("/api/countries/#{created_country.id}", headers:, params:)
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["name"]).to eq("New Country Name")
    end

    it "responds 404 Not Found when the country does not exist" do
      put("/api/countries/0", headers:, params:)
      expect(response).to have_http_status(:not_found)
    end

    it "responds 422 Unprocessable Content when the name is blank" do
      put("/api/countries/#{created_country.id}", headers:, params: { country: { name: "" } })
      expect(response).to have_http_status(:unprocessable_content)
    end
  end
end
