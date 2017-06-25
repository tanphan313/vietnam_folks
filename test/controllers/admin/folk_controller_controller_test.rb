require 'test_helper'

class Admin::FolkControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_folk_controller_index_url
    assert_response :success
  end

end
