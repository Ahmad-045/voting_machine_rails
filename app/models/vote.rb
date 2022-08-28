class Vote < ApplicationRecord
  validates_presence_of :user_id, :candidate_id

  belongs_to :candidate
  belongs_to :user
end
