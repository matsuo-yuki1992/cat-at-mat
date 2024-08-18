class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.bigint :user_id, null: false
      t.bigint :genre_id, null: false
      t.timestamps
    end
    
    add_foreign_key :posts, :users
    add_foreign_key :posts, :genres
  end
end
