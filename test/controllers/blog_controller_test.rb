require 'test_helper'

class BlogControllerTest < ActionDispatch::IntegrationTest
  test "should get lessicu" do
    get blog_lessicu_url
    assert_response :success
  end

end
