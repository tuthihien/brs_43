class SearchBooksController < ApplicationController
  def create
    if params[:type] == Settings.type
      @books = search_category params[:keyword]
    else
      @books = Book.find_of_diffrent_category params[:type], params[:keyword]
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def search_category keyword
    category = Category.find_by name: keyword
    if category.nil?
      flash[:succsess] = t "error_find_category"
      redirect_to root_url
    else
      @books = category.books
    end
  end
end
