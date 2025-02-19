require 'application_system_test_case'

class UserFlowTest < ApplicationSystemTestCase
  setup do
    @user = User.create(email: "user@example.com", password: "password")
    @book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
  end

  test "user borrows and returns a book" do
    visit root_path
    click_on "Login"
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_on "Log in"

    visit book_path(@book)
    click_on "Borrow"
    assert_text "Currently Borrowed Books"
    assert_text @book.title

    click_on "Return"
    assert_no_text @book.title
  end
end