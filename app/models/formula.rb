class Formula < ApplicationRecord
  monetize :price_cents
  validates :name, presence: :true
  validates :name, uniqueness: true
  validates :comment, presence: :true
  validates :photo_url, presence: :true
  validates :number_of_sessions, presence: :true
  validates :price_cents, presence: :true
end
