# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    user_id { "member-1" }
    role { "member" }

  end
end