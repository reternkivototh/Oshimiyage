class Admin::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all
  end

  def edit
  end

  private

  def post_image_params
    params.require(:post_image).permit(:name, :comment, :way_of_getting, :price, :prefecture, :user_id, :tag_id)
  end
end
