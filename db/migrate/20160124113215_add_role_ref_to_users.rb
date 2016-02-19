class AddRoleRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :state, index: true, foreign_key: true
    rename_column :users, :state_id, :role_id
  end
end
