class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :phone_num, presence: true

  def total_paid
    total = 0
    self.trips.each do |trip|
      total += trip.cost
    end

    return total.to_f/100.round(2)
  end
end
