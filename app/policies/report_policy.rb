class ReportPolicy < ApplicationPolicy
  def index?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'show')
  end

  def summary?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'update')
  end

  def agents?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'show')
  end

  def inboxes?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'create')
  end

  def labels?
    @account_user.custom_role.permissions.exists?(model: @record.name, action: 'destroy')
  end
end
