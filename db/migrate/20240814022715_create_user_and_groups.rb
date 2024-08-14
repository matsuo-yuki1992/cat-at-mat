class CreateUserAndGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_and_groups do |t|

      t.timestamps
    end
  end
end
