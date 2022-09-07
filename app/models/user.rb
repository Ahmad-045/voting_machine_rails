# frozen_string_literal: true

class User < ApplicationRecord

  before_create :set_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :validatable

  validates :name, :avatar, :halka_id, :cnic, presence: true
  validate  :correct_image_type

  belongs_to :halka
  has_one :vote, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  enum role: { admin: 0, candidate: 1, voter: 2 }

  private

  def set_default_role
    self.role ||= :voter
  end

  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w[image/jpeg image/jpg image/png])
      errors.add(:avatar, 'must be an image of type JPEG, JPG or PNG. ')
    elsif avatar.attached? == false
      errors.add(:avatar, 'required')
    end
  end

end
