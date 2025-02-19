require 'test_helper'

class BookBorrowingTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(email: "user@example.com", password: "password")
    @book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    sign_in @user
  end

  test "should borrow book" do
    get book_url(@book)
    assert_response :success

    assert_difference('Borrowing.count') do
      post borrowings_url, params: { book_id: @book.id }
    end
    assert_redirected_to user_url(@user)
  end
end