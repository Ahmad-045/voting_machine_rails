# frozen_string_literal: true

class Halka < ApplicationRecord
  has_many :users, dependent: :destroy
end
