class Admin::TagsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      @tags = Tag.all
      render :index
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path(@tag.id)
    else
      render :edit
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
