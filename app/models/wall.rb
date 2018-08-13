class Wall < ApplicationRecord
  belongs_to :user
  # belongs_to :user, through: :bookings
  has_many :bookings
end
# belongs to user through wall 