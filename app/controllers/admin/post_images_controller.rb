class Admin::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.all
  end

  def edit
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:name, :comment, :way_of_getting, :price, :prefecture, :user_id, :tag_ids)
  end
end
