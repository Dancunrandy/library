class BorrowingsController < ApplicationController
  before_action :authenticate_user

  def create
    @book = Book.find_by(id: params[:book_id])

    if @book.nil?
      redirect_to books_path, alert: "Book not found." and return
    end

    if @book.available?
      borrowing = current_user.borrowings.new(book: @book, due_date: 2.weeks.from_now)
      
      if borrowing.save
        redirect_to @book, notice: "Book borrowed successfully."
      else
        redirect_to @book, alert: "Failed to borrow book."
      end
    else
      redirect_to @book, alert: "Book is not available."
    end
  end

  def destroy
    @borrowing = current_user.borrowings.find_by(id: params[:id])

    if @borrowing
      @borrowing.return_book
      redirect_to user_path(current_user), notice: "Book returned successfully."
    else
      redirect_to user_path(current_user), alert: "Borrowing record not found."
    end
  end
end
