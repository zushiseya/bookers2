class BooksController < ApplicationController
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/top'
  end
  
  def show
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end 
end