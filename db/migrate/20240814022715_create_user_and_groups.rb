class CreateUserAndGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_and_groups do |t|
      t.bigint :user_id, null: false
      t.bigint :group_id, null: false
      t.timestamps
    end
    
    add_foreign_key :user_and_groups, :users
    add_foreign_key :user_and_groups, :groups
  end
end
