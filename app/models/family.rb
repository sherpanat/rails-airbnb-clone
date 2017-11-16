class Family < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :customers, through: :bookings
  has_attachment :photo

  validates :name, presence: true
  validates :country_origin, presence: true
  validates :city, presence: true
  validates :pension, presence: true, inclusion: { in: %w(half-board full-board all-inclusive), message: "%{value} must be half-board, full-board or all-inclusive" }
  validates :photo, presence: true
  # validates :churchgoer
  # validates :swinger
  # validates :members
  geocoded_by :country_origin
  after_validation :geocode, if: :country_origin_changed?
end
