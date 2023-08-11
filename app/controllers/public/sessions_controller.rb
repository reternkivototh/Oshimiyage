# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    public_user_path(@user.id)
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def reject_user
    @user = User.find_by(params[:user][:email])
    if @user
      if user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "退会済みです。再度ご登録してご利用ください。"
        redirect_to new_user_registration_path
      else
        flash[:notice] = "項目を入力してください。"
      end
    end
  end
end
