# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "ahmad#{n}@test.com"}
    name { 'Ahmad Amin' }
    cnic { '33100-4979893-7' }
    password { 'asdasd' }
    halka
    given_vote { false }

    after(:build) do |user|
      user.avatar.attach(
        io: File.open(Rails.root.join('/home/dev/Desktop/finalProject/voting_machine/app/assets/images/ahmad.jpg')),
        filename: 'ahmad.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
