class Checkup < ApplicationRecord
  belongs_to :user
  has_many :forms
  validates :user, presence: true
  validates :date, presence: true
  validates :date, uniqueness: true
  monetize :price_cents

  def self.availabilities
    @checkups = Checkup.all
    @availabilities = Hash.new()
    @checkups.each do |c|
      str_date = DateTime.strptime(c.date.to_s, '%Y-%m-%d').to_s
      @availabilities[str_date] = @availabilities[str_date] ? @availabilities[str_date] << c : [c]
    end
    @availabilities
  end
end
