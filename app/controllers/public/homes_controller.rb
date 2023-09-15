class Public::HomesController < ApplicationController
  def top
    @random = PostImage.order("RANDOM()").limit(1)
    @post_images = PostImage.all.order(created_at: :desc).limit(3)
    @all_ranks = PostImage.find(Bookmark.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
  end

  def about
  end
end
