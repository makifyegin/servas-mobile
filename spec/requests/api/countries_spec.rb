require 'swagger_helper'

RSpec.describe 'Countries API', type: :request do
  path '/api/countries' do
    get 'List countries' do
      tags 'Countries'
      produces 'application/json'
      parameter name: :Authorization, in: :header, schema: { type: :string }, required: true
      security [{ bearer_auth: [] }]
      response '200', 'countries found' do
        let(:Authorization) { 'Bearer fake-token' }

        before { stub_authenticated_user }
        run_test!
      end
    end

    post 'Create a country' do
      tags 'Countries'
      produces 'application/json'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, schema: { type: :string }, required: true
      parameter name: :country, in: :body, schema: { type: :object }
      security [{ bearer_auth: [] }]
      response '201', 'countries created' do
        let(:Authorization) { 'Bearer fake-token' }
        let(:group) { Group.create!(name: "Servas Britain & Ireland") }
        let(:country) { { country: { name: "Ireland", group_id: group.id } } }
        before do
          stub_authenticated_user(sub: "owner-1")
          Role.create!(user_id: "owner-1", role: "admin")

        end
        run_test!
      end
    end
  end
end