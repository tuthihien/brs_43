class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :admin_user, only: :destroy
  before_action :load_user, only: [:update, :show, :edit]

  def index
    @users = User.scope_by_date.paginate(page: params[:page]).limit Settings.per_page
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:infor] = t "update"
      redirect_to root_url
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "user_not_found"
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end

  def admin_user
    flash[:danger] = t "you_not_admin"
    redirect_to root_url unless current_user.admin?
  end
end
