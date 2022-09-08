# frozen_string_literal: true

class Halka < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :candidates, dependent: :destroy

  # validate :check_for_admin

  private

  # def check_for_admin
  #   errors.add(:base, 'Admin Halka Cannot be deleted')
  # end
end
