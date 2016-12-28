class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @books = Book.paginate page: params[:page], per_page: Settings.per_page
  end

  def detail
  end
end
