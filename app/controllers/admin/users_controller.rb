class Admin::UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user = User.page(params[:page]).per(9)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :prefecture, :gender, :birth_year, :birth_month, :is_deleted)
  end
end
