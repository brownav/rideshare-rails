class PassengersController < ActionController
  def index
    @passengers = Passenger.all
  end

  def show
    id = params[:id]
    @passenger = Passenger.find(id)
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @Passenger.save
      redirect_to passengers_path
    else
      render :new
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    if @Passenger.update(passenger_params)
      redirect_to passengers_path
    else
      render :edit
    end
  end

  def destroy
    id = params[:id]
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
