class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # N : N
  # I am renting a wall
  has_many :bookings
  has_many :rented_walls, through: :bookings, source: :wall

  # 1 : N
  # I own a wall
  has_many :owned_walls, class_name: "Wall"
  has_many :completed_projects

  mount_uploader :avatar, PhotoUploader
end
