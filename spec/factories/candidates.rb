# frozen_string_literal: true

FactoryBot.define do
  factory :candidate do
    party_name { 'PTI' }
    approved { false }
    halka

    after(:build) do |can|
      can.party_symbol.attach(
        io: File.open(Rails.root.join('/home/dev/Desktop/finalProject/voting_machine/app/assets/images/images.jpeg')),
        filename: 'images.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
