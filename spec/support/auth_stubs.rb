# frozen_string_literal: true

module AuthStubs
  def stub_authenticated_user(sub: "test-user")
    allow(HydraAdminApiClient).to receive(:introspect).and_return({ "active" => true, "sub" => sub })
  end
end
