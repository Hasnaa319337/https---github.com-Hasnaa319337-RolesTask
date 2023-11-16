class CampaignPolicy < ApplicationPolicy
  def index?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'show')
  end

  def update?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'update')
  end

  def show?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'show')
  end

  def create?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'create')
  end

  def destroy?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'destroy')
  end
end
