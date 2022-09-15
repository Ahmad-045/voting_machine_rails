# frozen_string_literal: true

FactoryBot.define do
  factory :election do
    start_time { Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S') }
    end_time { '2022-09-17 19:54:04' }
  end
end
