require "rails_helper"

RSpec.describe "GET /api/countries", type: :request do
  it "Returns all countries" do
    create(:country)
    get "/api/countries"
    expect(response).to have_http_status(:ok)
    expect(response.parsed_body.size).to eq(1)
  end
end
