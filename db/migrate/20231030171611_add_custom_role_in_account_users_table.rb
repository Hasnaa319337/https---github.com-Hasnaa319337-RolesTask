class AddCustomRoleInAccountUsersTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :account_users, :custom_role
  end
end
