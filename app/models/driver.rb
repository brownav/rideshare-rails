class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true

  def avg_rating
    total_rating = 0
    self.trips.all.each do |trip|
      total_rating += trip.rating
    end
    average_rating = total_rating/self.trips.length.to_f
    return average_rating.round(1)
  end

  def total_earnings
    subtotal = 0
    self.trips.each do |trip|
      trip.cost -= 1.65
      subtotal += trip.cost
    end
    total = (subtotal * 0.8)/100
    return total.round(2)
  end

end
