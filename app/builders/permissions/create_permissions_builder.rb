class Permissions::CreatePermissionsBuilder
  pattr_initialize [:custom_role_id, :permissions]
  def perform
    @new_permissions = []
    permissions.each do |permission|
      action = permission.split('_').first
      controller = permission.split('_').last
      new_permission = Permission.find_or_create_by(
        action: action,
        controller: controller
      )
      @new_permissions.push(new_permission)
    end
    @new_permissions
  end
end
