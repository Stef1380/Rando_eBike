class BookingsController < ApplicationController


  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bike_path(@booking.bike)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
