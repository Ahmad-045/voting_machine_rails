class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  validates_presence_of :party_name

  scope :not_approved, -> { where(approved: false) }
  scope :approved, -> { where(approved: true) }

end
