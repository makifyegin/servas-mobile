require 'swagger_helper'

RSpec.describe 'Countries API', type: :request do
  path '/api/countries' do
    post 'Create a country' do
      tags 'Countries'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, schema: { type: :string }, required: true
      parameter name: :country, in: :body, schema: {
        type: :object,
        properties: {
          country: {
            type: :object,
            properties: {
              name: { type: :string, example: "Scotland" },
              group_id: { type: :integer, example: 1 }
            },
            required: %w[name group_id]
          }
        }
      }
      security [ { bearer_auth: [] } ]

      # Shared by every response below
      let(:Authorization) { 'Bearer fake-token' }
      let(:group) { create(:group) }
      let(:country) { { country: { name: "Ireland", group_id: group.id } } }

      response '201', 'country created' do
        before do
          stub_authenticated_user(sub: "admin-1")
          create(:role, :admin, user_id: "admin-1")
        end
        run_test!
      end

      response '403', 'forbidden, not admin' do
        before do
          stub_authenticated_user(sub: "member-1")
          create(:role)
        end
        run_test!
      end

      response '422', 'country already exists' do
        before do
          stub_authenticated_user(sub: "admin-1")
          create(:role, user_id: "admin-1", role: "admin")
          create(:country, name: "Ireland", group: group)
        end
        run_test!
      end
    end
  end
end
