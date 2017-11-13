class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: "user_id"
  belongs_to :booked_family, class_name: 'Family', foreign_key: "family_id"
end
