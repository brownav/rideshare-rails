class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true, uniqueness: true
  validates :vin, presence: true, uniqueness: true

  def avg_rating
    if self.trips.count == 0
      return "No trips yet"
    else
      total_rating = 0
      trip_count = 0

      self.trips.all.each do |trip|
        if trip.rating
          total_rating += trip.rating
          trip_count += 1
        end
      end

      average_rating = total_rating.to_f/trip_count
      
      return average_rating.round(1)
    end
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
