# frozen_string_literal: true

class Vote < ApplicationRecord
  validates :user_id, :candidate_id, presence: true

  belongs_to :candidate
  belongs_to :user
end
