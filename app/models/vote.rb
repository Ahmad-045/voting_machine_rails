# frozen_string_literal: true

class Vote < ApplicationRecord
  # validates :user_id, :candidate_id, presence: true
  validates :user_id, uniqueness: true

  before_save :update_user_status

  belongs_to :candidate
  belongs_to :user

  private

  def update_user_status
    user_id = self.user_id
    return unless User.exists?(user_id)

    user = User.find(user_id)
    user.given_vote = true
    user.save
  end
end
