require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  test "should get addbook" do
    get book_addbook_url
    assert_response :success
  end

  test "should get getallbooks" do
    get book_getallbooks_url
    assert_response :success
  end

  test "should get deletebooks" do
    get book_deletebooks_url
    assert_response :success
  end
end
