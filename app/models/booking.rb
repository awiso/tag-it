class Booking < ApplicationRecord
  belongs_to :wall
  belongs_to :user
end
