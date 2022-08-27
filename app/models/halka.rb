class Halka < ApplicationRecord
  has_many :users, dependent: :destroy
end
