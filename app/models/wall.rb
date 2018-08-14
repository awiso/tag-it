class Wall < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
