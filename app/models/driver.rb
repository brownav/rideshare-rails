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


end
