class ApplicationController < ActionController::Base
  before_action :search

  private

  def search
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true)
    @result = params[:q]&.values&.reject(&:blank?)
  end
end
