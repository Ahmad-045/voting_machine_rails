# frozen_string_literal: true

class Election < ApplicationRecord
  validates :end_time, presence: true

  validate :compare_start_end_time

  private

  def compare_start_end_time
    return false unless end_time.to_datetime

    errors.add(:end_time, 'Its in PAST') if end_time.to_datetime <= Time.zone.now.localtime.strftime('%a, %d %b %Y %H:%M:%S')
  end
end
