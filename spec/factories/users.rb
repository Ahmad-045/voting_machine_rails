# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "ahmad#{n}@test.com"}
    name { 'Ahmad Amin' }
    cnic { '33100-4979893-7' }
    password { 'asdasd' }
    halka
  end
end
