class Public::PostCommentsController < ApplicationController
  before_action :guest_check

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    if comment.save
      redirect_to public_post_image_path(post_image.id)
    else
      @post_image = PostImage.find(params[:post_image_id])
      @user = User.find(@post_image.user.id)
      @post_comment = PostComment.new
      render 'public/post_images/show'
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to public_post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
