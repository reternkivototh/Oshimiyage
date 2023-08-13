class CreatePostCommentsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|

      t.integer :user_id
      t.integer :post_image_id
      t.text :comment, null: false

      t.timestamps
    end
  end
end
