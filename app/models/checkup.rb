class Checkup < ApplicationRecord
  belongs_to :user
  has_many :forms
  validates :user, presence: :true
  validates :start_time, uniqueness: true

  def self.availabilities
    @checkups = Checkup.all
    @availabilities = Hash.new()
    @checkups.each do |c|
      date = DateTime.strptime(c.start_time.to_s, '%Y-%m-%d').to_s
      #value = @availabilities[date]
      #@availabilities[date] = (c.user == current_user || value == -1) ? -1 :  value + 1
      @availabilities[date] = @availabilities[date] ? @availabilities[date] << c : [c]
    end
    @availabilities
  end
end