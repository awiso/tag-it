class AddInitialMessageToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :initial_message, :text
  end
end
