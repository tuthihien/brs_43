class BooksController < ApplicationController
  def show
    @review = Review.new
    @categories = Category.all
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "load_book_error"
      redirect_to root_url
    end
  end
end
