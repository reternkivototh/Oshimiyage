class CreatePostImagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.integer :user_id
      t.string :name
      t.text :comment
      t.integer :prefecture
      t.integer :way_of_getting
      t.integer :price

      t.timestamps
    end
  end
end
