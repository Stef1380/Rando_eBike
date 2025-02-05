class BikesController < ApplicationController

def index
  @bikes = Bike.all
end

def show
  @bike = Bike.find(params[:id])
  @bookings = @bike.bookings
end

def new
  @bike = Bike.new
end

def create
  @bike = Bike.new(bike_params)
  @bike.user = current_user
  if @bike.save
    redirect_to bike_path(@bike)
  else
    render :new
  end
end

def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to root_path, status: :see_other
end



private

  def bike_params
    params.require(:bike).permit(:name, :description, :photo)
  end

end
