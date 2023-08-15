class Public::PostImagesController < ApplicationController
  def index
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to public_post_images_path
  end

  def new
    @post_image = PostImage.new
  end

  def show
  end



  private

  def post_image_params
    params.require(:post_image).permit(:name, :comment, :way_of_getting, :price, :prefecture, :user_id, :tag_id)
  end
end
