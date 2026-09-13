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
  end
end