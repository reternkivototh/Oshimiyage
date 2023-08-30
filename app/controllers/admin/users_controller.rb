class Admin::UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :prefecture, :gender, :birth_year, :birth_month)
  end
end
