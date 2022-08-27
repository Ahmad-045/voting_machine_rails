class User < ApplicationRecord
  before_create :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :validatable


  belongs_to :halka
  validates_presence_of :name, :avatar, :halka_id, :cnic
  validate  :correct_image_type


  has_one_attached :avatar, dependent: :destroy

  enum role: { admin: 0, candidate: 1, voter: 2 }


  private

  def set_default_role
    self.role ||= :voter
  end

  def correct_image_type
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:avatar, 'must be an image of type JPEG, JPG or PNG. ')
    elsif avatar.attached? == false
      errors.add(:avatar, 'required')
    end
  end

end
