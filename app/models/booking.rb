class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: "user_id"
  belongs_to :booked_family, class_name: 'Family', foreign_key: "family_id"
  validate :valid_date

  def valid_date
    if end_date < start_date
      errors.add(:end_date)
    end
  end

end
