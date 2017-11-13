class Family < ApplicationRecord
  has_many :bookings
  has_many :customers, through: :bookings
  belongs_to :owner, class_name: "User", foreign_key: :user_id

end
