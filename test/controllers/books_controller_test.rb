require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
  end

  test "should get index" do
    get books_url
    assert_response :success
  end
end