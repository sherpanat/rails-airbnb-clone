class Family < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :customers, through: :bookings
  validates :name, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true
  validates :pension, presence: true, inclusion: { in: %w(half-board full-board all-inclusive), message: "%{value} must be half-board, full-board or all-inclusive" }
  validates :churchgoer, presence: true, default: false
  validates :swinger, presence: true, default: true
  validates :members, presence: true
  geocoded_by :country_origin
  after_validation :geocode, if: :country_origin_changed?
end

