class PostImage < ApplicationRecord

  enum way_of_getting: { buy: 0, receive: 1 }

  enum prefecture: {
    "---":0,
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
    沖縄県:47
  }

  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :posting_tags
  has_many :tags, through: :posting_tags

  validates :name, presence: true
  validates :my_comment, presence: true
  validates :way_of_getting, presence: true

  def self.create_all_ranks
     @all_ranks = PostImage.find(Bookmark.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["comment", "created_at", "id", "name", "prefecture", "price", "updated_at", "user_id", "way_of_getting"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookmarks", "image_attachment", "image_blob", "post_comments", "posting_tags", "tags", "user"] #アソシエーション先を記述
  end
end
