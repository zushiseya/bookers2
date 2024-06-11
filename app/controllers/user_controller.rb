class UserController < ApplicationController
  def show
    @user = Book.find[params:id]
    @book = @user.book
  end

  def edit
  end
end
