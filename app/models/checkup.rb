class Checkup < ApplicationRecord
  belongs_to :user
  has_many :forms
  validates :user, presence: true
  validates :date, presence: true
  validates :date, uniqueness: true
  monetize :price_cents

  def self.planning
    { Sunday:    [],
      Monday:    [ 9, 10, 11, 14, 15, 16, 17],
      Tuesday:   [ 9, 10, 11, 14, 15, 16, 17],
      Wednesday: [ 9, 10, 11],
      Thursday:  [ 9, 10, 11, 14, 15, 16, 17],
      Friday:    [ 9, 10, 11, 14, 15, 16, 17],
      Saturday:  []}
  end

  def self.price(online, user)
    price = online ? 24 : 28
    price += 10 if user.checkups.empty?
  end

  def self.booking(params, online, user)
    booking_date = DateTime.parse("#{params[:date]} #{params[:time]}")
    create( date: booking_date,
            user: user,
            online: online,
            state:'pending',
            price: price(online, user))
  end
end
