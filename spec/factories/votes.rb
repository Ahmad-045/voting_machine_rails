# frozen_string_literal: true

FactoryBot.define do
  factory :votes do
    candidate
    user
  end
end
