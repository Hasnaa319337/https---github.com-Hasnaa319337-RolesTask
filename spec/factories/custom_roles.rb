FactoryBot.define do
  factory :custom_role do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:description) { |n| "Name #{n}" }
  end
end
