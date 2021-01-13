require 'test_helper'

class GourmetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gourmets_index_url
    assert_response :success
  end

end
