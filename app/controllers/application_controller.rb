class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please_log_in"
      redirect_to login_url
    end
  end

  def following
    load_user
    @title = t "following"
    @users = @user.following.scope_by_date.paginate page: params[:page]
    render :show_follow
  end

  def followers
    load_user
    @title = t "followers"
    @users = @user.followers.scope_by_date.paginate page: params[:page]
    render :show_follow
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "not_user"
      redirect_to root_url
    end
  end
end
