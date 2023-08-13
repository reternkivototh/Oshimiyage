class CreatePostingTagTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posting_tags do |t|

      t.integer :tag_id
      t.integer :post_image_id

      t.timestamps
    end
  end
end
