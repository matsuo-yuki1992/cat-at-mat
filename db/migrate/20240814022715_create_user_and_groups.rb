class CreateUserAndGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_and_groups do |t|

      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end
end
