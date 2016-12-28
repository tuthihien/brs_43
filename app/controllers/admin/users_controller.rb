class Admin::UsersController < ApplicationController
  before_action :load_user, only: :destroy

  def destroy
    if @user.destroy
      flash[:success] = t "deleted"
      redirect_to users_path
    else
      flash[:danger] = t "error_destroy"
      redirect_to users_path
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "error_load_user"
      redirect_to users_path
    end
  end
end
