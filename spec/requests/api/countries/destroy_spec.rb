require "swagger_helper"

RSpec.describe "Deleting a country", type: :request do
  path '/api/countries/{id}' do
    parameter name: :id, in: :path, type: :integer

    delete 'Delete a country' do
      tags 'Countries'
      produces 'application/json'
      parameter name: :Authorization, in: :header, schema: { type: :string }, required: true
      security [ { bearer_auth: [] } ]

      # Shared by every response below
      let(:Authorization) { 'Bearer fake-token' }
      let(:country) { create(:country) }   # a REAL record: it must exist before we delete it
      let(:id) { country.id }              # fills the {id} in the URL

      response '204', 'country deleted' do
        before do
          stub_authenticated_user(sub: "admin-1")
          create(:role, :admin, user_id: "admin-1")
        end

        run_test!
      end

      response '403', 'forbidden, not admin' do
        before do
          stub_authenticated_user(sub: "member-1")
          create(:role, user_id: "member-1")   # default role is member
        end

        run_test!
      end

      response '404', 'not existent' do
        let(:id) { 0 }   # overrides the shared let(:id): no country has id 0

        before do
          stub_authenticated_user(sub: "admin-1")
          create(:role, :admin, user_id: "admin-1")   # default role is member

        end
        run_test!
      end
    end
  end
end