class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @wall = Wall.find(params[:wall_id])
    @booking.wall = @wall
    if @booking.save
      redirect_to owner_bookings_path
    else
      render 'walls/show'
    end
    authorize @booking
    authorize @wall
  end

  private

  def bookings_params
    params.require(:booking).permit(:date)
  end

end
