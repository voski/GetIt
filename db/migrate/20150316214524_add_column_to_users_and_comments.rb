class AddColumnToUsersAndComments < ActiveRecord::Migration
  def change
    add_column :users, :commentable_id, :integer
    add_column :goals, :user_id, :integer, default: 0
    change_column :goals, :user_id, :integer, null: false
  end
end
