require 'test_helper'

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without user_id" do
    book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    borrowing = Borrowing.new(book: book, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a user_id"
  end

  test "should not save borrowing without book_id" do
    user = User.create(email: "user@example.com", password: "password")
    borrowing = Borrowing.new(user: user, due_date: 2.weeks.from_now)
    assert_not borrowing.save, "Saved the borrowing without a book_id"
  end

  test "should not save borrowing without due_date" do
    user = User.create(email: "user@example.com", password: "password")
    book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    borrowing = Borrowing.new(user: user, book: book)
    assert_not borrowing.save, "Saved the borrowing without a due_date"
  end


  test "should mark book as returned" do
    user = User.create(email: "user@example.com", password: "password")
    book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    borrowing = Borrowing.create(user: user, book: book, due_date: 2.weeks.from_now)
    borrowing.return_book
    assert borrowing.returned?, "Borrowing should be marked as returned"
  end
end