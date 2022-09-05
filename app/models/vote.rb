# frozen_string_literal: true

class Vote < ApplicationRecord
  validates :user_id, :candidate_id, presence: true

  before_save :update_user_status

  belongs_to :candidate
  belongs_to :user

  private

  def update_user_status
    user_id = self.user_id
    if User.exists?(user_id)
      user = User.find(user_id)
      user.given_vote = true
      redirect_to root_path, alert: 'Error, Updating the User status' unless user.save
    else
      redirect_to root_path, alert: 'Resource Not Found'
    end
  end
end
