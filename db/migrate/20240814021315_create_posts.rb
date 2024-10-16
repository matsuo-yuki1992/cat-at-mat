class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.text :address
      t.float :latitude
      t.float :longitude
      t.bigint :user_id, null: false
      t.bigint :genre_id, null: false
      t.timestamps
    end
    
    add_foreign_key :posts, :users
    add_foreign_key :posts, :genres
  end
end
