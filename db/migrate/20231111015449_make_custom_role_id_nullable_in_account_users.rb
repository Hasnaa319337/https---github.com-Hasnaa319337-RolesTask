class MakeCustomRoleIdNullableInAccountUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :account_users, :custom_role_id, :bigint, null: true
  end

  def down
    change_column :account_users, :custom_role_id, :bigint, null: false
  end
end
