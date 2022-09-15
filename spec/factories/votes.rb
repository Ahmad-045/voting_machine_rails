# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    candidate
    user
  end
end
