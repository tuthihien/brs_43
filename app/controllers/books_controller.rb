class BooksController < ApplicationController
  def show
    @review = Review.new
    @categories = Category.all
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "load_book_error"
      redirect_to root_url
    end
    @value_rate = Rate.rates_of_book(params[:id]).find_by user_id: current_user.id if logged_in?
    @rate = Rate.new
    @avg_rating = @book.avg_rate
  end
end
