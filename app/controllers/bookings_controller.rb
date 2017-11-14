class BookingsController < ApplicationController
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
    @booking.user_id = @user.id
    @booking.family_id = @family.id
    @booking.total_price = date_diff * @family.price_per_day
    if @booking.save
      redirect_to bookings_path
    else
      render 'families/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :review_from_owner, :review_from_customer, :total_price)
  end

  def set_user
    @user = current_user
  end

  def set_family
    @family = Family.find(params[:family_id])
  end

  def date_diff
    start_date = Date.new(booking_params["start_date(1i)"].to_i, booking_params["start_date(2i)"].to_i, booking_params["start_date(3i)"].to_i)
    end_date = Date.new(booking_params["end_date(1i)"].to_i, booking_params["end_date(2i)"].to_i, booking_params["end_date(3i)"].to_i)
    (end_date - start_date).to_i
  end
end
