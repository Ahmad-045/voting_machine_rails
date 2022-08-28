class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  validates_presence_of :party_name

  scope :not_approved, -> { where(approved: false) }
  scope :approved, -> { where(approved: true) }
  scope :user_details, ->(user_ids) { User.where("id IN (?) ", user_ids) }

end
