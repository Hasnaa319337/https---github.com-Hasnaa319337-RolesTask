class RenameControllerColumnToModelInPermissionsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :permissions, :controller, :model
  end
end
