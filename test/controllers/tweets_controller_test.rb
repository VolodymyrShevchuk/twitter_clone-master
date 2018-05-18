require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tweets_new_url
    assert_response :success
  end

  test "should get destroy" do
    get tweets_destroy_url
    assert_response :success
  end

  test "should get show" do
    get tweets_show_url
    assert_response :success
  end

end
