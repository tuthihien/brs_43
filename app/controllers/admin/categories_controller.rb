class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.order_date_desc.paginate page: params[:page],
      per_page: Settings.per_page
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "create_category"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "category_updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "del_complete"
      redirect_to :back
    else
      flash[:danger] = t "invalid"
      redirect_to request.referrer
    end
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t "category_not_found"
      redirect_to request.referrer
    end
  end
end
