require "test_helper"

class Api::CountriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_countries_index_url
    assert_response :success
  end
end
