class ConfirmationsController < ApplicationController


  def update
    @booking = Booking.find(booking_params[:id])
    @booking.status = booking_params[:status]
    # if change all other bookings to declined:
    # if booking_params[:status] == "accepted"
    #   @booking.wall.bookings.where.not(id: booking_params[:id]).each do |b|
    #     b.status = "declined"
    #     b.save
    #   end
    # end
    @booking.save
    skip_authorization
    redirect_to requests_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :id)
  end

end
