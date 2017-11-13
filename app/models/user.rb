class User < ApplicationRecord
  has_many :bookings
  has_many :booked_families, through: :bookings
  has_many :families
end
