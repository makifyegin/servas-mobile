require "faraday"
class HydraAdminApiClient
  HYDRA_ADMIN_API_URL = ENV.fetch("HYDRA_ADMIN_API_URL", "http://localhost:4445")


class << self
  def introspect(...)
    new.introspect(...)
  end
end

def introspect(token:)
  response = conn.post("admin/oauth2/introspect", token: token)
  response.body
end


private

def conn
  @conn ||= Faraday.new(HYDRA_ADMIN_API_URL) do |f|
    f.request :url_encoded
    f.response :json
    f.response :raise_error
  end
end
end
