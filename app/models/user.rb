class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  geocoded_by :address
  after_validation :geocode, if: :user_address_changed?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :checkups
  has_many :forms, through: :checkups
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def user_address_changed?
    city_changed? || country_changed? || address_changed? || zip_code_changed?
  end
end
