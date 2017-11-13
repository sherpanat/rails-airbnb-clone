class Customer::BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: params[:user_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking =
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review_from_owner, :review_from_customer)
  end
end
