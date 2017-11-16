module FamilyHelper
  def find_family(family_id)
    Family.find(family_id)
  end
  def choice_review(family, booking)
    if current_user.id == family.user_id
      if booking.review_from_owner!
        render 'bookings/review_customer_form', booking: booking
      end
    else
      if booking.review_from_customer
        render 'bookings/display_review', booking: booking
      else
        render 'bookings/review_family_form', booking: booking
      end
    end
  end
end
