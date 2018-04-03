class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    id = params[:id]
    @passengers = Passenger.all
    @driver = Driver.find(id)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if @Driver.update(driver_params)
      redirect_to drivers_path
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end
end
