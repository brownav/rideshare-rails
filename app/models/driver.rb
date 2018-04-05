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
    total = 0
    self.trips.each do |trip|
      trip.cost -= 1.65
      total += trip.cost
    end
    return total * .8
  end

end
