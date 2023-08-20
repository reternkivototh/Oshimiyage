class PostingTag < ApplicationRecord

  belongs_to :post_image
  belongs_to :tag
end
