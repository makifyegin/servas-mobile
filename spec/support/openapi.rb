# frozen_string_literal: true
require "rspec/openapi"

RSpec::OpenAPI.path = "swagger/v1/openapi.yaml"
RSpec::OpenAPI.title = "Servas API"
RSpec::OpenAPI.openapi_version = "3.1.0"
RSpec::OpenAPI.servers = [{ url: "http://localhost:3001" }]
RSpec::OpenAPI.security_schemes = {
  "bearer_auth" => { type: "http", scheme: "bearer" }
}