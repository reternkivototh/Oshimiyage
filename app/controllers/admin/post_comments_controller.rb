class Admin::PostCommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = Comment.new
    comment.post_image_id = post_image.id
    if comment.save
      redirect_to public_post_image_path(post_image.id)
    else
      redirect_to public_post_images_path(post_image.id)
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    redirect_to admin_post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
