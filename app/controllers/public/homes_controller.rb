class Public::HomesController < ApplicationController
  def top
    random = Rails.env.production? ?  "rand()" : "RANDOM()"
    @random = PostImage.order(random).limit(1)
    @post_images = PostImage.all.order(created_at: :desc).limit(3)
    @all_ranks = PostImage.create_all_ranks
  end

  def about
  end

  private


end
