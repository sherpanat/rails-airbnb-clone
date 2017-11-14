class Customer::BookingsController < ApplicationController
  before_action :set_user, only: %i(index new create)
  before_action :set_family, only: %i(new create)
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
    start_date = booking_params[:start_date]
    end_date = booking_params[:end_date]
    total_price = (end_date - start_date).to_i * @family.price_per_day
    @booking.total_price = total_price
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
