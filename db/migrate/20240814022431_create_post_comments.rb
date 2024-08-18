class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :body, null: false
      t.bigint :user_id, null: false
      t.bigint :post_id, null: false
      t.timestamps
    end
    
    add_foreign_key :post_comments, :users
    add_foreign_key :post_comments, :posts
  end
end
