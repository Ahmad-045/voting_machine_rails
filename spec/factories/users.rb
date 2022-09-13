# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "ahmad#{n}@test.com"}
    name { 'Ahmad Amin' }
    cnic { '33100-4979893-7' }
    password { 'asdasd' }
    halka

    after(:build) do |user|
      user.avatar.attach(
        io: File.open(Rails.root.join('/home/dev/Desktop/finalProject/voting_machine/app/assets/images/ahmad.jpg')),
        filename: 'ahmad.jpg',
        content_type: 'image/jpg'
      )
    end
  end
end
