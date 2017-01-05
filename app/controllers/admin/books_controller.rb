class Admin::BooksController < ApplicationController
  before_action :load_book, only: [:edit, :update, :destroy]
  before_action :load_category, expect: :destroy

  def index
    @books = Book.order_alphabet.paginate(
      page: params[:page]).limit Settings.per_page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t "add_book_success"
      redirect_to admin_books_path
    else
      flash[:danger] = t "error"
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "update_book_success"
      redirect_to admin_books_path
    else
      flash[:danger] = t "error"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = t "deleted"
      redirect_to admin_books_path
    else
      flash[:danger] = t "delete_error"
      redirect_to admin_books_path
    end
  end

  private
  def load_book
    @book = Book.find_by id: params[:id]
    unless @book
      flash[:danger] = t "load_book_error"
      redirect_to admin_books_path
    end
  end

  def book_params
    params.require(:book).permit :title, :author, :num_page, :rate,
      :category_id, :publish_date, :image
  end

  def load_category
    @categories = Category.all
  end
end
