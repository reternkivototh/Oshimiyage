class Public::PostImagesController < ApplicationController
  protect_from_forgery

  def index
    @post_images = PostImage.page(params[:page]).per(9)
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      tag_ids =  params[:post_image][:tag_ids]
      tag_ids.shift

      tag_ids.each do |id|
        PostingTag.create(post_image_id: @post_image.id, tag_id: id)
      end
      redirect_to public_post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def new
    @post_image = PostImage.new
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = User.find(@post_image.user.id)
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      @post_image.tags.destroy_all
      tag_ids =  params[:post_image][:tag_ids]
      tag_ids.shift
      tag_ids.each do |id|
        PostingTag.create(post_image_id: @post_image.id, tag_id: id)
      end

      redirect_to public_post_image_path(@post_image.id)
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.user_id = current_user.id
    @post_image.destroy
    redirect_to public_post_images_path
  end



  private

  def post_image_params
    params.require(:post_image).permit(:image, :name, :my_comment, :way_of_getting, :price, :prefecture, :user_id, :tag_ids, :comment)
  end


end
