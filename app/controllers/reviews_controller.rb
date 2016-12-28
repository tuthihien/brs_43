class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :load_review, only: [:destroy, :edit, :update]

  def create
    @review = current_user.reviews.build review_params
    if @review.save
      flash[:success] = t "add_review_success"
      redirect_to request.referrer
    else
      flash[:danger] = t "error_create"
      redirect_to root_url
    end
  end

  def destroy
    if @review.destroy
      flash[:success] = t "deleted"
      redirect_to request.referrer
    else
      flash[:danger] = t "error_delete"
      redirect_to root_url
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if @review.update_attributes review_params
      flash[:success] = t "update_review"
      redirect_to book_path @review.book_id
    else
      flash[:success] = "loi"
      redirect_to edit_review_path @review
    end
  end

  private
  def review_params
    params.require(:review).permit :title, :content_review, :book_id
  end

  def load_review
    @review = Review.find_by id: params[:id]
    unless @review
      flash[:danger] = t "error_load_review"
      redirect_to request.referrer
    end
  end
end
