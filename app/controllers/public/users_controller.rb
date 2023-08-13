class Public::UsersController < ApplicationController
  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :prefecture, :gender, :birth_year, :birth_month)
  end


end
