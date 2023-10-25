require "test_helper"

class BucketListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bucket_list = bucket_lists(:one)
  end

  test "should get index" do
    get bucket_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_bucket_list_url
    assert_response :success
  end

  test "should create bucket_list" do
    assert_difference("BucketList.count") do
      post bucket_lists_url, params: { bucket_list: { item: @bucket_list.item, user_id: @bucket_list.user_id } }
    end

    assert_redirected_to bucket_list_url(BucketList.last)
  end

  test "should show bucket_list" do
    get bucket_list_url(@bucket_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_bucket_list_url(@bucket_list)
    assert_response :success
  end

  test "should update bucket_list" do
    patch bucket_list_url(@bucket_list), params: { bucket_list: { item: @bucket_list.item, user_id: @bucket_list.user_id } }
    assert_redirected_to bucket_list_url(@bucket_list)
  end

  test "should destroy bucket_list" do
    assert_difference("BucketList.count", -1) do
      delete bucket_list_url(@bucket_list)
    end

    assert_redirected_to bucket_lists_url
  end
end
