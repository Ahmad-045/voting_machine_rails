# frozen_string_literal: true

class Halka < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :candidates, dependent: :destroy

  validates :name, presence: true
end
