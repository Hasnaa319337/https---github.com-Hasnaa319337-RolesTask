class Api::V1::Accounts::CustomRolesController < Api::V1::Accounts::BaseController
  before_action :custom_role, only: [:update, :show, :destroy]
  before_action :check_authorization
  def index
    @custom_roles = CustomRole.all
  end

  def show; end

  def create
    new_custom_role_params = custom_role_params.slice(:name, :description)
    @custom_role = CustomRole.new(new_custom_role_params)
    if @custom_role.save
      new_permissions = Permissions::CreatePermissionsBuilder.new(
        permissions: custom_role_params[:permissions]
      ).perform
      @custom_role.permissions = new_permissions
      @custom_role.save

    else
      render json: @custom_role.errors, status: :unprocessable_entity
    end
  end

  def update
    if params[:custom_role][:permissions].present?
      new_permissions = Permissions::CreatePermissionsBuilder.new(
        permissions: custom_role_params[:permissions]
      ).perform
      @custom_role.permissions = new_permissions
      @custom_role.save
    end
    new_custom_role_params = custom_role_params.slice(:name, :description)
    return if @custom_role.update(new_custom_role_params)

    render json: @custom_role.errors, status: :unprocessable_entity
  end

  def destroy
    @custom_role.destroy!
    head :ok
  end

  private

  def check_authorization
    raise Pundit::NotAuthorizedError unless Current.account_user.administrator?
  end

  def custom_role
    @custom_role ||= CustomRole.find_by(id: params[:id])
  end

  def custom_role_params
    params.require(:custom_role).permit(:name, :description, permissions: [])
  end
end
