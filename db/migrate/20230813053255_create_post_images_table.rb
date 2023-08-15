class CreatePostImagesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|

      t.integer :user_id
      t.string :name, null: false
      t.text :comment
      t.integer :prefecture, null: false
      t.integer :way_of_getting, null: false
      t.integer :price

  def change
    create_table :PostImages do |t|
      t.integer :prefecture, null: false, default: 0
    end
  end

      t.timestamps
    end
  end
end
