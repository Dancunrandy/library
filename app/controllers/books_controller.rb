class BooksController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
end