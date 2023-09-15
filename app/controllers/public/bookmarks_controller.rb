class Public::BookmarksController < ApplicationController
  before_action :guest_check

  def create
    post_image = PostImage.find(params[:post_image_id])
    bookmark = current_user.bookmarks.build(bookmark_params)
    bookmark.save
    redirect_to public_post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    bookmark = current_user.bookmarks.find_by(post_image_id: post_image.id)
    bookmark.destroy
    redirect_to public_post_image_path(post_image)
  end

  private

  def bookmark_params
    params.permit(:post_image_id)
  end

end
