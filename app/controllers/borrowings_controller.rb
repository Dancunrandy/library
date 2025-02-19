class BorrowingsController < ApplicationController
  before_action :authenticate_user

  def create
    @book = Book.find(params[:book_id])
    if @book.available?
      Borrowing.create(user: current_user, book: @book, due_date: 2.weeks.from_now)
      redirect_to @book, notice: "Book borrowed successfully."
    else
      redirect_to @book, alert: "Book is not available."
    end
  end

  def destroy
    @borrowing = Borrowing.find(params[:id])
    @borrowing.return_book
    redirect_to user_path(current_user), notice: "Book returned successfully."
  end
end