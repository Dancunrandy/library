require 'test_helper'

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
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

  test "should return book" do
    borrowing = Borrowing.create(user: @user, book: @book, due_date: 2.weeks.from_now)
    patch borrowing_url(borrowing)
    assert_redirected_to user_url(@user)
  end

end