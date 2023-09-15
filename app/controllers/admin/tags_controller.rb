class Admin::TagsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save!
    redirect_to admin_tags_path
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    @tag.update(tag_params)
    redirect_to admin_tags_path(@tag.id)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
