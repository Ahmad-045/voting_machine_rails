# frozen_string_literal: true

class Candidate < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :halka
  validates :party_name, presence: true

  scope :not_approved, -> { where(approved: false) }
  scope :approved, -> { where(approved: true) }
  scope :user_details, ->(user_ids) { User.where('id IN (?) ', user_ids) }

  has_one_attached :party_symbol

end
