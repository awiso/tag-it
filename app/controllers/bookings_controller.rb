class BookingsController < ApplicationController

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @wall = Wall.find(params[:wall_id])
    @booking.wall = @wall
    if @booking.save
      redirect_to walls_path
    else
      render 'walls/show'
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:date)
  end

end

