class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def show
    id = params[:id]
    @trip = Trip.find(id)
  end

  def new
    passenger = Passenger.find_by(id: params[:passenger_id])

    driver = Driver.all.sample
    cost = rand(500...2000)
    date = Date.today
    rating = nil

    @trip = Trip.new(passenger: passenger, driver: driver, date: date, cost: cost, rating: rating)

    self.create
  end

  def create
    if @trip.save
      redirect_to passenger_path(@trip[:passenger_id])
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip.update(trip_params)
      redirect_to passenger_path(@trip.passenger)
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip.destroy
      redirect_to trips_path
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(:driver_id, :passenger_id, :date, :rating, :cost)
  end
end
