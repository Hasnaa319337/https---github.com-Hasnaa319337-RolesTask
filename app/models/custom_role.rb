# == Schema Information
#
# Table name: custom_roles
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CustomRole < ApplicationRecord
  has_many :custom_role_permissions, dependent: :destroy
  has_many :permissions, through: :custom_role_permissions

  validates :name, presence: true, uniqueness: true

  def current_permissions_stringified
    permissions.map do |p|
      "#{p.action}_#{p.controller}"
    end
  end
end
