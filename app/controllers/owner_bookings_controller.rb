class OwnerBookingsController < ApplicationController

  before_action :authenticate_user!
  def index
      policy_scope(Booking, policy_scope_class: OwnerBookingsPolicy::Scope)
      owned_walls = current_user.owned_walls
      @bookings = []
      owned_walls.each do |w|
        @bookings << w.bookings
      end
  end
end
