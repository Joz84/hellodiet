class Checkup < ApplicationRecord
  belongs_to :user
  has_many :forms
  validates :user, presence: true
  validates :date, presence: true
  validates :date, uniqueness: true
  monetize :price_cents

  def self.availabilities2
    @checkups = Checkup.all
    @availabilities = Hash.new()
    @checkups.each do |c|
      str_date = DateTime.strptime(c.date.to_s, '%Y-%m-%d').to_s
      @availabilities[str_date] = @availabilities[str_date] ? @availabilities[str_date] << c : [c]
    end
    @availabilities
  end

  def self.planning
    { Sunday:    [],
      Monday:    [ 9, 10, 11, 14, 15, 16, 17],
      Tuesday:   [ 9, 10, 11, 14, 15, 16, 17],
      Wednesday: [ 9, 10, 11],
      Thursday:  [ 9, 10, 11, 14, 15, 16, 17],
      Friday:    [ 9, 10, 11, 14, 15, 16, 17],
      Saturday:  []}
  end

  def self.booking(params, user)
    booking_date = DateTime.parse("#{params[:date]} #{params[:time]}")
    online = params[:online] == "true" ? true : false
    price = online ? 24 : 28
    price += 10 if user.checkups.empty?
    create( date: booking_date,
      user: user,
      online: online,
      state:'pending',
      price: price )
  end
end
