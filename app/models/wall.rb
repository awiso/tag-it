class Wall < ApplicationRecord
  include PgSearch

  belongs_to :user
  has_many :bookings

  mount_uploader :photo, PhotoUploader
  
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
