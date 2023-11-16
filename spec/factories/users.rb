# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    transient do
      skip_confirmation { true }
      role { 'agent' }
      auto_offline { true }
      account { nil }
      inviter { nil }
    end

    provider { 'email' }
    uid { SecureRandom.uuid }
    name { Faker::Name.name }
    display_name { Faker::Name.first_name }
    email { display_name + "@#{SecureRandom.uuid}.com" }
    password { 'Password1!' }

    after(:build) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
      if evaluator.account
        custom_role = if evaluator.role.to_s == 'agent'
                        AGENT_CUSTOM_ROLE
                      elsif evaluator.role.to_s == 'administrator'
                        ADMINISTRATOR_CUSTOM_ROLE
                      end
        create(:account_user, user: user, account: evaluator.account, role: evaluator.role, inviter: evaluator.inviter,
                              auto_offline: evaluator.auto_offline, custom_role: custom_role)
      end
    end

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root.join('spec/assets/avatar.png'), 'image/png') }
    end

    trait :administrator do
      role { 'administrator' }
    end
  end
end
