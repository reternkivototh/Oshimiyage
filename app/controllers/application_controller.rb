class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :authenticate_user!, except: [:top, :about, :index, :search_place, :search_tag, :search]
  before_action :search


  def search
    @q = PostImage.ransack(params[:q])
    @post_images = @q.result(distinct: true).page(params[:page]).per(9)
    @result = params[:q]&.values&.reject(&:blank?)
  end

  def admin_url
    request.fullpath.include?("/admin")
  end

  def guest_check
    if current_user == User.find(1)
      redirect_to root_path, notice: "この操作は会員登録が必要です。"
    end
  end

end
