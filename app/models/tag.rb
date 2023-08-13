class Tag < ApplicationRecord

  has_many :posting_tags
  has_many :post_images, through: :posting_tags
end
