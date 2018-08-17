class CompletedProject < ApplicationRecord
  belongs_to :user
  belongs_to :wall
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
