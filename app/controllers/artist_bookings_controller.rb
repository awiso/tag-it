class ArtistBookingsController < ApplicationController
  before_action :authenticate_user!
  def index
      policy_scope(Booking, policy_scope_class: ArtistBookingsPolicy::Scope)
      @bookings = current_user.bookings
  end
end
