require "application_system_test_case"

class BucketListsTest < ApplicationSystemTestCase
  setup do
    @bucket_list = bucket_lists(:one)
  end

  test "visiting the index" do
    visit bucket_lists_url
    assert_selector "h1", text: "Bucket lists"
  end

  test "should create bucket list" do
    visit bucket_lists_url
    click_on "New bucket list"

    fill_in "Item", with: @bucket_list.item
    fill_in "User", with: @bucket_list.user_id
    click_on "Create Bucket list"

    assert_text "Bucket list was successfully created"
    click_on "Back"
  end

  test "should update Bucket list" do
    visit bucket_list_url(@bucket_list)
    click_on "Edit this bucket list", match: :first

    fill_in "Item", with: @bucket_list.item
    fill_in "User", with: @bucket_list.user_id
    click_on "Update Bucket list"

    assert_text "Bucket list was successfully updated"
    click_on "Back"
  end

  test "should destroy Bucket list" do
    visit bucket_list_url(@bucket_list)
    click_on "Destroy this bucket list", match: :first

    assert_text "Bucket list was successfully destroyed"
  end
end
