class Customer::BookingsController < ApplicationController
  before_action :set_user, :set_family, only: %i(new create)
  def index
    @bookings = Booking.where(user_id: params[:user_id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.family = @family
    if @booking.save!
      redirect_to customer_bookings_path
    else
      render 'app/controller/families/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review_from_owner, :review_from_customer, :total_price)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_family
    @family = Family.find(params[:family_id])
  end
end
