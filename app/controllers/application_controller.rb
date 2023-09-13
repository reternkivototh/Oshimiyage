class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about, :index, :search, :search_place, :search_tag]
  before_action :search


  def search
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
end
