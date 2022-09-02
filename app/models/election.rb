# frozen_string_literal: true

class Election < ApplicationRecord
  validates :end_time, presence: true
end
