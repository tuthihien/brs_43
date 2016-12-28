class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find_by id: params[:id]
    if @category
      @books = @category.books
    else
      flash[:danger] = t "load_category_error"
      redirect_to root_url
    end
  end
end
