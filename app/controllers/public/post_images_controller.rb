class Public::PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    tag_ids =  params[:post_image][:tag_ids]
    tag_ids.shift

    tag_ids.each do |id|
      PostingTag.create(post_image_id: @post_image.id, tag_id: id)

    end
    redirect_to public_post_image_path(@post_image.id)
  end

  def new
    @post_image = PostImage.new
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = User.find(@post_image.user.id)
    @post_comment = PostComment.new
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.user_id = current_user.id
    @post_image.destroy
    redirect_to public_post_images_path
  end



  private

  def post_image_params
    params.require(:post_image).permit(:name, :comment, :way_of_getting, :price, :prefecture, :user_id, :tag_ids)
  end


end
