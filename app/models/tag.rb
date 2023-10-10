class Tag < ApplicationRecord

  has_many :posting_tags
  has_many :post_images, through: :posting_tags

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["post_images", "posting_tags"]
  end

end
