class Family < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :bookings
  has_many :customers, through: :bookings
  validates :name, presence: true
  validates :city, presence: true
  validates :price_per_day, presence: true
end
