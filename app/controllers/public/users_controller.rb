class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_image = @user.post_images

    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_image_id)
    @bookmark_list = PostImage.find(bookmarks)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    @user.update(user_params)
    redirect_to public_user_path
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
