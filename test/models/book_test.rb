require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "Author", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Title", isbn: "1234567890")
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save book without isbn" do
    book = Book.new(title: "Title", author: "Author")
    assert_not book.save, "Saved the book without an ISBN"
  end

  test "should not save book with duplicate isbn" do
    Book.create(title: "Title 1", author: "Author 1", isbn: "1234567890")
    book = Book.new(title: "Title 2", author: "Author 2", isbn: "1234567890")
    assert_not book.save, "Saved the book with a duplicate ISBN"
  end

  test "should return true if book is available" do
    book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    assert book.available?, "Book should be available"
  end

  test "should return false if book is not available" do
    book = Book.create(title: "Title", author: "Author", isbn: "1234567890")
    user = User.create(email: "user@example.com", password: "password")
    Borrowing.create(user: user, book: book, due_date: 2.weeks.from_now)
    assert_not book.available?, "Book should not be available"
  end
end