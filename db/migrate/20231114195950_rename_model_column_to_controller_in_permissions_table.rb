class RenameModelColumnToControllerInPermissionsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :permissions, :model, :controller
  end
end
