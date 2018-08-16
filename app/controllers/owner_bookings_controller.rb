class OwnerBookingsController < ApplicationController

  before_action :authenticate_user!
  def index
    # all confirmed bookings
    policy_scope(Booking, policy_scope_class: OwnerBookingsPolicy::Scope)
    @walls = current_user.owned_walls
    @bookings = current_user.bookings
  end

end
