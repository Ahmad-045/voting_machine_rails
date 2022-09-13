# frozen_string_literal: true

FactoryBot.define do
  factory :candidate do
    party_name { 'PTI' }
    approved { false }
    halka
  end
end
